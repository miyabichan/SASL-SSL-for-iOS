Introduction
============

OpenSSL and Cyrus-SASL for Latest iOS.

Usage
=====

 1. do "sh build-libraries.sh"
 2. libraries are created at "lib".
 3. Copy libs and headers to your project.
 4. Import "libssl.a", "libcrypto.a", "libsasl2.a".
 5. Reference Headers, "Headers/openssl", "Headers/sasl".
 6. Specifying the flag  "-lz" in "Other Linker Flags" (OTHER_LDFLAGS) setting in the "Linking" section in the Build settings of the target.
 7. If use cURL, see below,

        #include <sasl/sasl.h> 

        - (void)foo {    
            ...  
        }
