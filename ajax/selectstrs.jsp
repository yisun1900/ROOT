<%@ page contentType="text/html;charset=GBK" %>

<%
	ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

	String sql=request.getParameter("sql");
	String sql1=request.getParameter("sql1");
	String sql2=request.getParameter("sql2");
	String sql3=request.getParameter("sql3");

	sql=cf.SQLJM(sql);
	sql1=cf.SQLJM(sql1);
	sql2=cf.SQLJM(sql2);
	sql3=cf.SQLJM(sql3);

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

