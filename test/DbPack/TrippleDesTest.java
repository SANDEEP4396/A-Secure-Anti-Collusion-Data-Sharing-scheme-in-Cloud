/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DbPack;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Eswar
 */
public class TrippleDesTest {
    
    public TrippleDesTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of encrypt method, of class TrippleDes.
     */
    @Test
    public void testEncrypt() throws Exception {
        System.out.println("encrypt");
        String unencryptedString = "";
        TrippleDes instance = new TrippleDes();
        String expResult = "";
        String result = instance.encrypt(unencryptedString);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of decrypt method, of class TrippleDes.
     */
    @Test
    public void testDecrypt() throws Exception {
        System.out.println("decrypt");
        String encryptedString = "";
        TrippleDes instance = new TrippleDes();
        String expResult = "";
        String result = instance.decrypt(encryptedString);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
}
