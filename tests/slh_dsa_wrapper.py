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
            implementation_type,
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

            self.keygen_internal = slh_dsa.slh_keygen
            self.sign_internal = slh_dsa.slh_sign
            self.verify_internal = slh_dsa.slh_verify

    def bytearray_to_ctype(self, ba):
        char_array = ctypes.c_char * len(ba)
        return char_array.from_buffer(ba)

    def bytearray_to_ctype_copy(self, ba):
        char_array = ctypes.c_char * len(ba)
        return char_array.from_buffer_copy(ba)

    def prepare_context_and_message_for_api(self, context, message):
        context_buffer = self.bytearray_to_ctype(context)
        context_ptr_int = ctypes.cast(context_buffer, ctypes.c_void_p).value or 0
        context_len = len(context)

        message_buffer = self.bytearray_to_ctype(message)
        message_ptr_int = ctypes.cast(message_buffer, ctypes.c_void_p).value or 0
        message_len = len(message)

        # context pointer and size are passed as individual u64 arguments
        context_pointer = ctypes.c_uint64(context_ptr_int)
        context_size = ctypes.c_uint64(context_len)
        
        # message pointer and size are passed as individual u64 arguments
        message_pointer = ctypes.c_uint64(message_ptr_int)
        message_size = ctypes.c_uint64(message_len)

        # Keep buffers alive alongside the prepared args
        return context_buffer, message_buffer, context_pointer, context_size, message_pointer, message_size

    def generate_keypair(self, randomness):
        verification_key = ctypes.create_string_buffer(b"255", self.verification_key_size)
        signing_key = ctypes.create_string_buffer(b"255", self.signing_key_size)

        self.keygen_internal(
            signing_key,
            verification_key
            #self.bytearray_to_ctype(randomness)
        )

        return (verification_key.raw, signing_key.raw)

    def sign(self, signing_key, context, message, randomness):
        signature = ctypes.create_string_buffer(b"255", self.signature_size)

        context_buffer, message_buffer, context_pointer, context_size, message_pointer, message_size = (
            self.prepare_context_and_message_for_api(context, message)
        )

        result = self.sign_internal(
            signature,
            context_pointer,
            context_size,
            message_pointer,
            message_size,
            self.bytearray_to_ctype_copy(signing_key)
            # self.bytearray_to_ctype(randomness),
        )

        return signature.raw, result

    def verify(self, verification_key, context, message, signature):
        context_buffer, message_buffer, context_pointer, context_size, message_pointer, message_size = (
            self.prepare_context_and_message_for_api(context, message)
        )

        return self.verify_internal(
            context_pointer,
            context_size,
            message_pointer,
            message_size,
            self.bytearray_to_ctype_copy(signature),
            self.bytearray_to_ctype_copy(verification_key)
        )