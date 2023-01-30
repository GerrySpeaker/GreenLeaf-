import application.AutenticazioneApplicationTest;
import junit.framework.TestCase;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import storage.UtenteDaoTest;


@RunWith(Suite.class)
@Suite.SuiteClasses({
        UtenteDaoTest.class,
        AutenticazioneApplicationTest.class

})
public class JUnitTestSuite extends TestCase {


}
