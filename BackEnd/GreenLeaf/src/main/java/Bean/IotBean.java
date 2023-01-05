package Bean;

public class IotBean {

    public Integer idIot;
    public String ipv4, latitudine, longitudine, altitudine;

    public IotBean(Integer idIot, String ipv4, String latitudine, String longitudine, String altitudine) {
        this.idIot = idIot;
        this.ipv4 = ipv4;
        this.latitudine = latitudine;
        this.longitudine = longitudine;
        this.altitudine = altitudine;
    }

    public Integer getIdIot() {
        return idIot;
    }

    public void setIdIot(Integer idIot) {
        this.idIot = idIot;
    }

    public String getIpv4() {
        return ipv4;
    }

    public void setIpv4(String ipv4) {
        this.ipv4 = ipv4;
    }

    public String getLatitudine() {
        return latitudine;
    }

    public void setLatitudine(String latitudine) {
        this.latitudine = latitudine;
    }

    public String getLongitudine() {
        return longitudine;
    }

    public void setLongitudine(String longitudine) {
        this.longitudine = longitudine;
    }

    public String getAltitudine() {
        return altitudine;
    }

    public void setAltitudine(String altitudine) {
        this.altitudine = altitudine;
    }

    @Override
    public String toString() {
        return "IotBean{" +
                "idIot=" + idIot +
                ", ipv4='" + ipv4 + '\'' +
                ", latitudine='" + latitudine + '\'' +
                ", longitudine='" + longitudine + '\'' +
                ", altitudine='" + altitudine + '\'' +
                '}';
    }
}
