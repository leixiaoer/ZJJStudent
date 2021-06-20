package cn.ppdxzz.utils;

/**
 * @author Administrator
 * 测试加密效果类
 */
public class TestBianMa {

    public static void main(String[] args) {
        String uname = "请输入您的密码";
        for (int i = 0; i < uname.length(); i++) {
            char unamechar = uname.charAt(i);
            System.out.print(gbEncoding(String.valueOf(unamechar)));
        }

    }

    /**
     * 把中文转成Unicode编码
     *
     * @param gbString
     * @return
     */
    private static String gbEncoding(final String gbString) {
        char[] utfBytes = gbString.toCharArray();
        String unicodeBytes = "";
        for (int byteIndex = 0; byteIndex < utfBytes.length; byteIndex++) {
            String hexB = Integer.toHexString(utfBytes[byteIndex]);
            if (hexB.length() <= 2) {
                hexB = "00" + hexB;
            }
            unicodeBytes = unicodeBytes + "\\u" + hexB;
        }
        return unicodeBytes;
    }

}