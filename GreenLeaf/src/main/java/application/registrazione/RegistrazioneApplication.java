package application.registrazione;


import bean.AdminBean;
import bean.OperatoreBean;
import bean.UtenteBean;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import storage.AdminDao;
import storage.OperatoreDao;
import storage.UtenteDao;

@WebServlet("/RegistrazioneApplication")
public class RegistrazioneApplication extends HttpServlet {

  private static final long serialVersionUID = 1L;
  static UtenteDao dao = new UtenteDao();
  static OperatoreDao operatoreDao = new OperatoreDao();
  static AdminDao adminDao = new AdminDao();

  private UtenteBean bean = new UtenteBean();
  private UtenteBean user = new UtenteBean();
  private OperatoreBean operatore = new OperatoreBean();
  private AdminBean adminBean = new AdminBean();

  public RegistrazioneApplication() {
    super();
  }


  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    if (request.getSession().getAttribute("email") == null) {


      String email = request.getParameter("email");
      String psw = request.getParameter("password");
      String name = request.getParameter("nome");
      String surname = request.getParameter("cognome");
      String data = request.getParameter("data");

      Date date = Date.valueOf(LocalDate.now());


      if (email != null && psw != null && name != null && surname != null) {


        Boolean mail =
            Pattern.matches("^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$", email);
        Boolean pass = Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$", psw);
        Boolean nome = Pattern.matches("^[A-Za-z ,.']+$", name);
        Boolean cognome = Pattern.matches("^[A-Za-z]+$", surname);


        if (mail == false || pass == false || nome == false || cognome == false) {
          response.sendRedirect(request.getContextPath() + "/registrazione.jsp?check=true");
          return;
        }

        Date data1 = null;
        data1 = Date.valueOf(data);


        if (data1.after(date) || data1.equals(date)) {
          response.sendRedirect(request.getContextPath() + "/registrazione.jsp?data=true");
          return;
        }

        bean.setDataNascita(data1);
        bean.setEmail(email);
        bean.setPassword(psw);
        bean.setNomeUtente(name);
        bean.setCognomeUtente(surname);

        UtenteBean utenteLogin;

        try {
          utenteLogin = dao.doRetrieveByEmail(bean.getEmail());
          adminBean = adminDao.doRetrieveByEmail(bean.getEmail());
          operatore = operatoreDao.doRetrieveByEmail(bean.getEmail());
          if (utenteLogin.getEmail() == null && adminBean.getEmail() == null
              && operatore.getNomeOperatore() == null) {
            dao.registrazione(bean);
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
          } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp?check=true");
          }

        } catch (Exception e) {
          e.printStackTrace();
          response.sendRedirect(request.getContextPath() + "/registrazione.jsp?check=true");
        }
      } else {
        response.sendRedirect(request.getContextPath() + "/registrazione.jsp?check=true");
      }
    } else {
      response.sendRedirect(request.getContextPath() + "/homepage.jsp");
    }

  }
}
