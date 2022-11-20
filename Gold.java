import java.time.LocalDate;

public class Gold {
    private String id;
    private String khuVuc;
    private String heThong;
    private int giaMua;
    private int giaBan;
    private int chenhLech;
    private LocalDate timeCrawlData;

    public Gold(String id, String khuVuc, String heThong, int giaMua, int giaBan, int chenhLech, LocalDate dtf) {
        this.id = id;
        this.khuVuc = khuVuc;
        this.heThong = heThong;
        this.giaMua = giaMua;
        this.giaBan = giaBan;
        this.chenhLech = chenhLech;
        this.timeCrawlData = dtf;
    }

    public String getKhuVuc() {
        return khuVuc;
    }

    public String getHeThong() {
        return heThong;
    }

    public int getGiaMua() {
        return giaMua;
    }

    public int getGiaBan() {
        return giaBan;
    }

    public int getChenhLech() {
        return chenhLech;
    }

    public String getId() {
        return id;
    }

    public LocalDate getTimeCrawlData() {
        return timeCrawlData;
    }

    @Override
    public String toString() {
        return "Gold{" +
                "id=" + id +
                ", khuVuc='" + khuVuc + '\'' +
                ", heThong='" + heThong + '\'' +
                ", giaMua=" + giaMua +
                ", giaBan=" + giaBan +
                ", chenhLech=" + chenhLech +
                ", timeCrawlData='" + timeCrawlData + '\'' +
                '}';
    }

    public String toString1() {
        char c = '"';
        String s = c + id + c + "," + c + khuVuc + c + "," + c + heThong + c + "," + giaMua + "," + giaBan + "," + chenhLech + "," + timeCrawlData;
        return s;
    }
}
