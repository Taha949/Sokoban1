import java.io.*;
public class ActionHandler {

    public static void main(String args[])
    {
        try
        {
            File file = new File("actions.txt");
            FileReader fr = new FileReader(file);
            BufferedReader br = new BufferedReader(fr);
            StringBuffer sb = new StringBuffer();
            String line;
            String rep = new String();
            while((line = br.readLine()) != null)
            {
                if(line.contains("moveright") || line.contains("pushright")){
                    rep+= "R";
                }
                else if(line.contains("moveleft") || line.contains("pushleft")) {
                    rep+= "L";
                }
                else if(line.contains("moveup") || line.contains("pushup")) {
                    rep+= "U";
                }
                else {
                    rep+= "D";
                }

                sb.append(line);
                sb.append("\n");
            }
            fr.close();
            System.out.println("Contenu du fichier: ");
            System.out.println(sb.toString());
            System.out.println(rep);
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }
}
