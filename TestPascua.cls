public class CalcularFechaPascua {

    public static List<Integer> funcPascua(Integer year) {
        // Julian calendar
        Integer G = year % 19; // Golden number - 1
        Integer I = (19 * G + 15) % 30; // Days from March 21 to the Paschal full moon.
        Integer J = (year + (year / 4) + I) % 7; // Day for the Paschal full moon

        // Gregorian calendar
        Integer C = year / 100;
        Integer H = ((C - (C / 4) - (((8 * C) + 13) / 25) + (19 * G) + 15) % 30);
        Integer I_gregorian = H - (H / 28) * (1 - (29 / (H + 1)) * ((21 - G) / 11));
        Integer J_gregorian = ((year + (year / 4) + I_gregorian + 2 - C + (C / 4))) % 7;
        Integer L = I_gregorian - J_gregorian; // Days between March 21 and the Sunday before the Paschal full moon

        Integer month = 3 + ((L + 40) / 44);
        Integer day = L + 28 - (31 * (month / 4));

        List<Integer> result = new List<Integer>{month, day};
        return result;
    }

    public static void main() {
        Integer year = 2023; // You can replace this with user input or any specific year
        List<Integer> pascua = funcPascua(year);
        System.debug(year + '-' + pascua[0] + '-' + pascua[1]);
    }
}
