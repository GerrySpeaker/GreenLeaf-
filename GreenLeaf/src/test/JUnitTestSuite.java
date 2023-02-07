import application.AutenticazioneApplicationTest;
import application.GestioneAlberiDaAdottare.AggiungiAlCarrello;
import application.GestioneAlberiDaAdottare.AggiungiAlCarrelloTest;
import junit.framework.TestCase;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import storage.*;


@RunWith(Suite.class)
@Suite.SuiteClasses({
        UtenteDaoTest.class,
        AutenticazioneApplicationTest.class,
        OperatoreDaoTest.class,
        AlberoDaoTest.class,
        AggiungiAlCarrelloTest.class

})
public class JUnitTestSuite extends TestCase {


}
