byte[] iv = new byte[16]; // BAD: all zeroes
GCMParameterSpec params = new GCMParameterSpec(128, iv);
Cipher cipher = Cipher.getInstance("AES/GCM/PKCS5PADDING");
cipher.init(Cipher.ENCRYPT_MODE, key, params);