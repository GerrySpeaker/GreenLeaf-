import application.AutenticazioneApplicationTest;
import application.gestionealberidaadottare.AggiungiAlCarrelloTest;
import junit.framework.TestCase;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import storage.AlberoDaoTest;
import storage.OperatoreDaoEliminaTest;
import storage.OperatoreDaoTest;


@RunWith(Suite.class)
@Suite.SuiteClasses({
    OperatoreDaoEliminaTest.class,
    AutenticazioneApplicationTest.class,
    OperatoreDaoTest.class,
    AlberoDaoTest.class,
    AggiungiAlCarrelloTest.class

})
public class Junittestsuite extends TestCase {


}
