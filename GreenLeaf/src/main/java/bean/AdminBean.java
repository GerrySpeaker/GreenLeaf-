package bean;

public class AdminBean {

    public String email,password, cognomeAdmin, nomeAdmin;

    public AdminBean() {
    }

    public AdminBean(String email, String password, String cognomeAdmin, String nomeAdmin) {
        this.email = email;
        this.password = password;
        this.cognomeAdmin = cognomeAdmin;
        this.nomeAdmin = nomeAdmin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCognomeAdmin() {
        return cognomeAdmin;
    }

    public void setCognomeAdmin(String cognomeAdmin) {
        this.cognomeAdmin = cognomeAdmin;
    }

    public String getNomeAdmin() {
        return nomeAdmin;
    }

    public void setNomeAdmin(String nomeAdmin) {
        this.nomeAdmin = nomeAdmin;
    }

    @Override
    public String toString() {
        return "AdminBean{" +
                "email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", cognome='" + cognomeAdmin + '\'' +
                ", nome='" + nomeAdmin + '\'' +
                '}';
    }
}
