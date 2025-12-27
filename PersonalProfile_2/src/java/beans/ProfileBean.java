package beans;

public class ProfileBean {
    private String studID;
    private String studName;
    private String program;
    private String email;
    private String hobbies;
    private String intro;
    
    public ProfileBean(){
        
    }
    
    public ProfileBean( String studID, String name, String prog, String email, String hobbies, String intro){
        
        this.studID = studID;
        studName = name;
        program = prog;
        this.email = email;
        this.hobbies = hobbies;
        this.intro = intro;        
    }
    

    public String getStudID(){
        return studID;
    }
    
    public String getStudName(){
        return studName;
    }
    
    public String getProgram(){
        return program;
    }
    
    public String getEmail() {
        return email;
    }
    
    public String getHobbies(){
        return hobbies;
    }
    
    public String getIntro(){
        return intro;
    }
    

    public void setStudID(String studID){
        this.studID = studID;
    }
    
    public void setStudName(String name){
        studName = name;
    }
    
    public void setProgram(String prog){
        program = prog;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public void setHobbies(String hobbies){
        this.hobbies = hobbies;
    }
    
    public void setIntro(String intro){
        this.intro = intro;
    }         
}
