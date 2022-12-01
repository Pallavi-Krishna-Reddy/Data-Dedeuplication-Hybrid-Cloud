/*
package com.example.hybrid_cloud.algo;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;

        
public class PassphraseCrypto implements Serializable {
    private static final String ALGORITHM = "PBEWithMD5AndDES";
    private final SecretKey key;
    private final String passphrase;
    private static final int SALT_LENGTH = 8;
    private static final int ITERATIONS = 20;
  
    public PassphraseCrypto( String passphrase )
    {
        this.passphrase = passphrase;
        KeySpec keySpec = new PBEKeySpec( passphrase.toCharArray() );
        try
        {
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance( ALGORITHM );
            key = keyFactory.generateSecret( keySpec );
           
        }
        catch( NoSuchAlgorithmException e )
        {
            throw new RuntimeException( "Unable to create secret key.", e );
        }
        catch( InvalidKeySpecException e )
        {
            throw new RuntimeException( "Invalid passphrase.", e );
        }
    }
     
    private byte[] doFinal( int operationMode, byte[] input, PBEParameterSpec params )
    {
        try
        {
            final Cipher cipher = Cipher.getInstance( ALGORITHM );
            cipher.init( operationMode, key, params );
           
            return cipher.doFinal( input );
        }
        catch( InvalidKeyException e )
        {
            throw new RuntimeException( "Invalid key.", e );
        }
        catch( BadPaddingException e )
        {
            throw new RuntimeException( "Bad padding.", e );
        }
        catch( NoSuchAlgorithmException e )
        {
            throw new RuntimeException( "Unable to construct cipher.", e );
        }
        catch( IllegalBlockSizeException e )
        {
            throw new RuntimeException( "Illegal block size.", e );
        }
        catch( NoSuchPaddingException e )
        {
            throw new RuntimeException( "No such padding.", e );
        }
        catch( InvalidAlgorithmParameterException e )
        {
            throw new RuntimeException( "Invalid parameters.", e );
        }
    }
  
    public byte[] encrypt( byte[] input )
    {
        try
        {
            final MessageDigest md = MessageDigest.getInstance( "MD5" );
            md.update( passphrase.getBytes() );
            md.update( input );
            byte[] digest = md.digest();
            final byte[] salt = new byte[SALT_LENGTH];
            System.arraycopy( digest, 0, salt, 0, SALT_LENGTH );
            final byte[] encrypted = doFinal( Cipher.ENCRYPT_MODE, input, new PBEParameterSpec( salt, ITERATIONS ) );
            final ByteArrayOutputStream bout = new ByteArrayOutputStream();
            bout.write( salt );
            bout.write( encrypted );
            return bout.toByteArray();
        }
        catch( NoSuchAlgorithmException e )
        {
            throw new RuntimeException( "MD5 algorithm not found.", e );
        }
        catch( IOException e )
        {
            throw new RuntimeException( "Unable to write output.", e );
        }
    }
  
    public byte[] decrypt( byte[] input )
    {
        final byte[] salt = new byte[SALT_LENGTH];
        System.arraycopy( input, 0, salt, 0, SALT_LENGTH );
        final int remainingBytes = input.length - SALT_LENGTH;
        final byte[] remainingInput = new byte[remainingBytes];
        System.arraycopy( input, SALT_LENGTH, remainingInput, 0, remainingBytes );
        return doFinal( Cipher.DECRYPT_MODE, remainingInput, new PBEParameterSpec( salt, ITERATIONS ) );
    }
}*/
