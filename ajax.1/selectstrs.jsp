<%@ page contentType="text/html;charset=GBK" %>

<%
	ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

	String sql=cf.GB2Uni(cf.getParameter(request,"sql"));
	String sql1=cf.GB2Uni(cf.getParameter(request,"sql1"));
	String sql2=cf.GB2Uni(cf.getParameter(request,"sql2"));
	String sql3=cf.GB2Uni(cf.getParameter(request,"sql3"));
//	out.print(sql);

	String rowDiv="%"; //�зָ��
	String colDiv="+"; //�зָ��

	String retStr="";
	if (!sql.equals(""))
	{
		if (!sql1.equals(""))
		{
			if (!sql2.equals(""))
			{
				if (!sql3.equals(""))
				{
					retStr+="[value1]";
					retStr+=cf.getSQLData(sql,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���

					retStr+="[value2]";
					retStr+=cf.getSQLData(sql1,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���

					retStr+="[value3]";
					retStr+=cf.getSQLData(sql2,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���

					retStr+="[value4]";
					retStr+=cf.getSQLData(sql3,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���
				}
				else{
					retStr+="[value1]";
					retStr+=cf.getSQLData(sql,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���

					retStr+="[value2]";
					retStr+=cf.getSQLData(sql1,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���

					retStr+="[value3]";
					retStr+=cf.getSQLData(sql2,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���
				}
			}
			else{
				retStr+="[value1]";
				retStr+=cf.getSQLData(sql,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���

				retStr+="[value2]";
				retStr+=cf.getSQLData(sql1,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���
			}
		}
		else{
			retStr+="[value1]";
			retStr+=cf.getSQLData(sql,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���
		}
	}

    out.print(retStr);  
%>

