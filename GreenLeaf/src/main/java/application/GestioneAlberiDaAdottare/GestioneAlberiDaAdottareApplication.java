package application.GestioneAlberiDaAdottare;

import bean.CategoriaBean;
import bean.IotBean;
import bean.OrdineBean;
import storage.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ordine")
public class GestioneAlberiDaAdottareApplication extends HttpServlet {

    private static final long serialVersionUID = 1L;
    static CategoriaDao model = new CategoriaDao();
    static OrdineDao ordineDao = new OrdineDao();
    static AlberoDao alberoDao = new AlberoDao();

    static IotDao iotDao = new IotDao();

    static BuonoRegaloDao buonoregaloDao = new BuonoRegaloDao();
    static OrdineBean ordineBean = new OrdineBean();



    public GestioneAlberiDaAdottareApplication() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<String> buonoReaglo = new ArrayList<>();

        String mail = (String) request.getSession().getAttribute("email");

        ArrayList<CategoriaBean> prodotti = (ArrayList<CategoriaBean>) request.getSession().getAttribute("prodottiCart");

        ArrayList<String> regione = (ArrayList<String>) request.getSession().getAttribute("regione");

        String totale = request.getParameter("totale");

        ArrayList<String> buoni = (ArrayList<String>) request.getSession().getAttribute("buonoregalo");

       ArrayList<String> buoniDaRiscattare = (ArrayList<String>) request.getSession().getAttribute("controllo"); //cambiare lo stato del buono utilizzato in Riscattato

        int i = 0;
        int j = 0;
        int sconto;


        Double total = Double.valueOf(totale);


        //Ogni IF è composto da due condizion in AND, in questo modo si è sicuri del fatto che verrà eseguito solo 1 di questi 3 casi

        if (buoni.size() == 0 && prodotti.size() !=0) {// non sono stati comprati buoni, allora inserisco solo albero e ordine (DB)
            System.out.println("comprati solo alberi");
            request.getSession().setAttribute("checkBuono",false);
                try {

                    int id = ordineDao.inserisciOrdine(mail, total);
                    ordineBean = ordineDao.doRetrieveByKey(id);

                    if (ordineBean != null) {
                        System.out.println("Inserimento ordine effettuato con successo, procedo ad inserire gli alberi nel db....");
                        while (i < prodotti.size()) {
                            IotBean iot = iotDao.doRetriveByRegione(regione.get(i));
                            iotDao.CambioStatoIot(iot.getIdIot());
                            alberoDao.inserisciAlbero(prodotti.get(i), ordineBean, regione.get(i),iot);
                            i++;
                        }

                        if(buoniDaRiscattare != null){
                            while (j<buoniDaRiscattare.size()){
                                buonoregaloDao.CambioStato(buoniDaRiscattare.get(j));
                                j++;
                            }
                            buoniDaRiscattare.clear();
                            request.getSession().setAttribute("controllo",buoniDaRiscattare);
                        }

                        prodotti.clear();
                        request.getSession().setAttribute("prodottiCart", prodotti);
                        regione.clear();
                        request.getSession().setAttribute("regione",regione);
                        total = 0.0;
                        request.getSession().setAttribute("totale",total);
                        request.getSession().setAttribute("sconto",0);
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        else if (buoni.size()!=0 && prodotti.size() !=0) { // sono stati comprati anche dei buoni, insieme ai prodotti, che vanno inseriti
            System.out.println("comprati sia alberi che buoni");
            request.getSession().setAttribute("checkBuono",true);
                try {
                    int id = ordineDao.inserisciOrdine(mail, total);
                    ordineBean = ordineDao.doRetrieveByKey(id);
                    if (ordineBean != null) {
                        System.out.println("Inserimento ordine effettuato con successo, procedo ad inserire gli alberi e i buoni nel db....");

                        System.out.println(prodotti);
                        System.out.println(buoni);

                        int dimProdotto = prodotti.size();
                        int dimBuoni = buoni.size();

                        for(i=0; i<dimProdotto; i++){
                            IotBean iot = iotDao.doRetriveByRegione(regione.get(i));
                            iotDao.CambioStatoIot(iot.getIdIot());
                            alberoDao.inserisciAlbero(prodotti.get(i), ordineBean, regione.get(i), iot);
                        }

                        System.out.println("Numero di buoni inseriti "+ buoni.size());

                        for(int k = 0; k<dimBuoni; k++){
                            String buono = GeneraBuono();
                            buonoReaglo.add(buono);
                            buonoregaloDao.InserisciBuono(ordineBean,buonoReaglo.get(k));
                        }


                        if(buoniDaRiscattare != null){
                            while (j<buoniDaRiscattare.size()){
                                buonoregaloDao.CambioStato(buoniDaRiscattare.get(j));
                                j++;
                            }
                            buoniDaRiscattare.clear();
                            request.getSession().setAttribute("controllo",buoniDaRiscattare);
                        }


                        prodotti.clear();
                        request.getSession().setAttribute("prodottiCart", prodotti);
                        regione.clear();
                        request.getSession().setAttribute("regione",regione);
                        buoni.clear();
                        request.getSession().setAttribute("buonoregalo",buoni);

                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            }
        else if (buoni.size()!=0 && prodotti.size() ==0) { //comprati solo buoni.
            System.out.println("comprati solo buoni");
            request.getSession().setAttribute("checkBuono",true);
            int k = 0;
                try {
                    int id = ordineDao.inserisciOrdine(mail, total);
                    ordineBean = ordineDao.doRetrieveByKey(id);
                    if (ordineBean != null) {
                        System.out.println("Inserimento ordine effettuato con successo, procedo ad inserire gli alberi nel db....");
                        while (k < buoni.size()) {
                            String buono = GeneraBuono();
                            buonoReaglo.add(buono);
                            buonoregaloDao.InserisciBuono(ordineBean,buonoReaglo.get(k));
                            k++;
                        }

                        if(buoniDaRiscattare != null){
                            while (j<buoniDaRiscattare.size()){
                                buonoregaloDao.CambioStato(buoniDaRiscattare.get(j));
                                j++;
                            }
                            buoniDaRiscattare.clear();
                            request.getSession().setAttribute("controllo",buoniDaRiscattare);

                        }

                        buoni.clear();
                        request.getSession().setAttribute("buonoregalo",buoni);
                    }

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
        }

        if(total == 0){
            response.sendRedirect(request.getContextPath()+"/acquisto_completato.jsp");
        }


    }
    public String GeneraBuono(){
        int leftLimit = 97; // letter 'a'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 10;
        Random random = new Random();
        StringBuilder buffer = new StringBuilder(targetStringLength);
        for (int i = 0; i < targetStringLength; i++) {
            int randomLimitedInt = leftLimit + (int) (random.nextFloat() * (rightLimit - leftLimit + 1));
            buffer.append((char) randomLimitedInt);
        }
        String generatedString = buffer.toString();

        return  generatedString;
    }
}


