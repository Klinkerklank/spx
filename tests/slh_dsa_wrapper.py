import ctypes
from pathlib import Path

from abc import ABC, abstractmethod

class SLH_DSA(ABC):
    @abstractmethod
    def generate_keypair(self, randomness):
        pass

    @abstractmethod
    def sign(self, signing_key, context, message, randomness):
        pass

    @abstractmethod
    def verify(self, verification_key, context, message, signature):
        pass

class SLH_DSA_X86_64(SLH_DSA):
    def __init__(self, parameter_set, implementation_type):
        slh_dsa_so_name = "slh_dsa_{}_{}_x86-64.so".format(
            parameter_set,
            implementation_type
        )
        slh_dsa = ctypes.PyDLL(Path(__file__).parent.parent / slh_dsa_so_name)

        self.parameter_set = parameter_set

        # While we could get this parameters from the source code, they
        # change so infrequently that we might as well just hardcode them
        # and be done with it.
        if parameter_set == "sha2-128s":
            self.verification_key_size = 32
            self.signing_key_size      = 64
            self.signature_size        = 7856
        elif parameter_set == "sha2-128f":
            self.verification_key_size = 32
            self.signing_key_size      = 64
            self.signature_size        = 17088
        elif parameter_set == "sha2-192s":
            self.verification_key_size = 48
            self.signing_key_size      = 96
            self.signature_size        = 16224
        elif parameter_set == "sha2-192f":
            self.verification_key_size = 48
            self.signing_key_size      = 96
            self.signature_size        = 35664
        elif parameter_set == "sha2-256s":
            self.verification_key_size = 64
            self.signing_key_size      = 128
            self.signature_size        = 29792
        elif parameter_set == "sha2-256f":
            self.verification_key_size = 64
            self.signing_key_size      = 128
            self.signature_size        = 49856

        self.keygen_internal = slh_dsa.slh_keygen_internal
        self.sign_internal   = slh_dsa.slh_sign_internal
        self.verify_internal = slh_dsa.slh_verify_internal

    def bytearray_to_ctype(self, ba):
        char_array = ctypes.c_char * len(ba)
        return char_array.from_buffer(ba)

    def bytearray_to_ctype_copy(self, ba):
        char_array = ctypes.c_char * len(ba)
        return char_array.from_buffer_copy(ba)

    def prepare_context_and_message_for_api(self, context, message):
        uint8_t_ptr = ctypes.POINTER(ctypes.c_uint8)

        context_buffer = self.bytearray_to_ctype(context)
        context_buffer_ptr = ctypes.cast(context_buffer, uint8_t_ptr)
        context_len = len(context)

        message_buffer = self.bytearray_to_ctype(message)
        message_buffer_ptr = ctypes.cast(message_buffer, uint8_t_ptr)
        message_len = len(message)

        context_message_pointers = (uint8_t_ptr * 2)(context_buffer_ptr, message_buffer_ptr)
        context_message_sizes = (ctypes.c_size_t * 2)(context_len, message_len)

        return context_message_pointers, context_message_sizes

    def generate_keypair(self, randomness):
        verification_key = ctypes.create_string_buffer(b"255", self.verification_key_size)
        signing_key = ctypes.create_string_buffer(b"255", self.signing_key_size)

        self.keygen_internal(
            signing_key,
            verification_key,
            self.bytearray_to_ctype(randomness)
        )

        return (verification_key.raw, signing_key.raw)

    def sign(self, signing_key, context, message, randomness):
        signature = ctypes.create_string_buffer(b"255", self.signature_size)

        context_message_pointers, context_message_sizes = (
            self.prepare_context_and_message_for_api(context, message)
        )

        result = self.sign_internal(
            signature,
            context_message_pointers,
            context_message_sizes,
            self.bytearray_to_ctype_copy(signing_key),
            self.bytearray_to_ctype(randomness)
        )

        return signature.raw, result

    def verify(self, verification_key, context, message, signature):
        context_message_pointers, context_message_sizes = (
            self.prepare_context_and_message_for_api(context, message)
        )

        return self.verify_internal(
            context_message_pointers,
            context_message_sizes,
            self.bytearray_to_ctype_copy(signature),
            self.bytearray_to_ctype_copy(verification_key)
        )