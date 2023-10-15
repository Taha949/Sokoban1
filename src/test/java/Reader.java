import java.io.*;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import fr.uga.pddl4j.heuristics.state.StateHeuristic;
import fr.uga.pddl4j.planners.LogLevel;
import fr.uga.pddl4j.planners.Planner;
import fr.uga.pddl4j.planners.statespace.HSP;
import fr.uga.pddl4j.problem.operator.Action;
import org.json.simple.parser.ParseException;

public class Reader {
    public static void main(String[] args) {
            JSONParser parser = new JSONParser();

            Object obj = null;
            try {
                obj = parser.parse(new FileReader("C:\\Users\\billi\\pddl4j\\sokoban\\config\\test1.json"));
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
            JSONObject jsonObject = (JSONObject) obj;
            String chaine = (String) jsonObject.get("testIn");

        String[] lignes = chaine.split("\n");

        System.out.println(chaine);

        int longeur = lignes.length;
        int compt = 0;
        int s = 0;

        for(int i = 0 ; i< longeur;i++) {
            if(lignes[i].length() >= s) {
                s = lignes[i].length();
                compt = i;
            }
        }

        System.out.println(compt);
        System.out.println(s);

        String chaineL = "";

        for(int i = 0 ; i< longeur;i++) {
            while(lignes[i].length() < s ) {
                lignes[i] = lignes[i] + "#";
            }

            chaineL += lignes[i];
        }

        for (String ligne : lignes) {
            System.out.println(ligne);
        }

        System.out.println(chaineL);




        String objects = "(:objects ";
        String init = "(:INIT ";
        String goal = "(:goal (and ";

        for(int i = 0; i < chaineL.length();i++) {
            int j = i+1;
            objects += "P"+j+" ";

        }

        objects += "- case)";



        for(int i = 0; i < chaineL.length();i++) {
            int j = i+1;
            if(chaineL.charAt(i) == ' ') {
                init += "(NotGuard P"+j+") (NotBlock P"+j+") ";

            }
            else if(chaineL.charAt(i) == '@') {
                init += "(Guard P"+j+") (NotBlock P"+j+") ";

            }
            else if(chaineL.charAt(i) == '$') {
                init += "(Block P"+j+")(NotGuard P"+j+") ";

            }
            else if(chaineL.charAt(i) == '.') {
                goal += "(Block P"+j+") ";
                init += "(NotGuard P"+j+") (NotBlock P"+j+") ";
            }
            else if(chaineL.charAt(i) == '+') {
                init += "(Guard P"+j+") (NotBlock P"+j+") ";
                goal += "(Block P"+j+") ";
            }
            else if(chaineL.charAt(i) == '*') {
                init += "(Block P"+j+")"+" (NotGuard P"+j+") ";
                goal += "(Block P"+j+") ";
            }
        }

        for(int i = 1; i< chaineL.length() ; i++) {
            int j = i+1;
            init += "(isRight P"+j+" P"+i+") ";
        }


        for(int i = 0; i < longeur-1 ; i++) {
            int j = i+1;
            for(int l = 0; l < s;l++) {
                int m = l+1;
                int n = s*i + m;
                int t = s*j+ m;
                init += "(over P"+n+" P"+t+") ";

            }
        }
        init += ")";
        goal += "))";

        System.out.println(objects);

        System.out.println(init);

        System.out.println(goal);

        String pddl_content = "(define (problem sokoban)\n(:domain sokobanDomain)\n" + objects +"\n" + init + "\n" + goal+")";


        try {
            FileWriter myWriter = new FileWriter("sokoban.pddl");
            myWriter.write(pddl_content);
            myWriter.close();
            System.out.println("Successfully wrote to the file.");


        } catch (IOException e) {
            System.out.println("Erreur.");
            e.printStackTrace();
        }


        fr.uga.pddl4j.planners.PlannerConfiguration config = HSP.getDefaultConfiguration();

        config.setProperty(HSP.DOMAIN_SETTING,"sokobanDomain.pddl");
        config.setProperty(HSP.PROBLEM_SETTING,"sokoban.pddl");
        config.setProperty(HSP.TIME_OUT_SETTING, 1000);
        config.setProperty(HSP.LOG_LEVEL_SETTING, LogLevel.INFO);
        config.setProperty(HSP.HEURISTIC_SETTING, StateHeuristic.Name.MAX);
        config.setProperty(HSP.WEIGHT_HEURISTIC_SETTING, 1.2);

        Planner planner = Planner.getInstance(Planner.Name.HSP, config);


        try {
            List<Action> list = planner.solve().actions();
            for(Action l:list) {
                System.out.println(l.toString());
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }



    }

}
