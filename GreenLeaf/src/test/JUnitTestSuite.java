import application.AutenticazioneApplicationTest;
import junit.framework.TestCase;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import storage.AlberoDaoTest;
import storage.BuonoRegaloDao;
import storage.OperatoreDaoTest;
import storage.UtenteDaoTest;


@RunWith(Suite.class)
@Suite.SuiteClasses({
        UtenteDaoTest.class,
        AutenticazioneApplicationTest.class,
        OperatoreDaoTest.class,
        AlberoDaoTest.class,
        BuonoRegaloDao.class

})
public class JUnitTestSuite extends TestCase {


}
