<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������� </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String ssfgs = null;
String fgsmc=null;


String[][] outStr=null; 
String bgcolor=null;

String sgd=null;
String sgdmc=null;
String bzmc=null;
String sgdjbbm=null;
String sgdjbmc=null;

String grsl=null;
String yygrsl=null;
String kygrsl=null;
String tdbzstr=null;
String tdbz=null;
String xbstr=null;
String xb=null;
String dh=null;
String zz=null;
String sfzh=null;
String sfqldhtstr=null;
String sfqldht=null;
String sfsbxstr=null;
String sfsbx=null;

String jjlxr=null;
String jjlxrdh=null;
String jjlxrdz=null;
String bz=null;

String mark=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int row=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	ssfgs =up.getParameter("ssfgs");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dwmc" ;
	sql+=" from sq_dwxx " ;
	sql+=" where dwbh='"+ssfgs+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		fgsmc = rs.getString("dwmc");			    
	}
	rs.close();
	ps.close();


	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>����೤</p>
    <p><font color="#FF0000">[<%=fgsmc%>]
	<BR>���Ѵ��ڣ�������滻�������������</b></font></p>
  </div>
	<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
  <table width="150%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">


	<tr bgcolor="#CCCCCC" align="center"> 
      <td width="4%"><font color="#CC0000">*</font>����ʩ����</td>
      <td width="5%"><font color="#CC0000">*</font>�೤����</td>
	  <td width="5%">����</td>
      <td width="3%">��������</td>
      <td width="3%">���ù�������</td>
      <td width="3%">���ù�������</td>
      <td width="3%"><font color="#CC0000">*</font>״̬</td>
	  <td width="4%">�Ա�</td>
      <td width="10%"><font color="#CC0000">*</font>�绰</td>
      <td width="6%"><font color="#CC0000">*</font>סַ</td>
      <td width="9%"><font color="#CC0000">*</font>���֤��</td>
      <td width="4%"><font color="#CC0000">*</font>�Ƿ�ǩ�Ͷ���ͬ</td>
      <td width="4%"><font color="#CC0000">*</font>�Ƿ��ϱ���</td>
      <td width="4%"><font color="#CC0000">*</font>������ϵ��</td>
      <td width="7%"><font color="#CC0000">*</font>��ϵ�˵绰</td>
      <td width="9%"><font color="#CC0000">*</font>������ϵ�˵�ַ</td>
      <td width="17%">��ע</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] sgdjbbmStr=new String[outStr.length-1];

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][1].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}
		row++;

		int len=outStr[i].length;

		sgdmc=outStr[i][0].trim();
		bzmc  =outStr[i][1].trim();
		sgdjbmc=outStr[i][2].trim();

		grsl=outStr[i][3].trim();
		yygrsl=outStr[i][4].trim();
		kygrsl=outStr[i][5].trim();

		tdbzstr=outStr[i][6].trim();
		xbstr=outStr[i][7].trim();

		dh=outStr[i][8].trim();
		zz=outStr[i][9].trim();
		sfzh=outStr[i][10].trim();
		sfqldhtstr=outStr[i][11].trim();
		sfsbxstr=outStr[i][12].trim();

		jjlxr=outStr[i][13].trim();
		jjlxrdh=outStr[i][14].trim();
		jjlxrdz=outStr[i][15].trim();
		bz=outStr[i][16].trim();



		mark="";

		if (bzmc.equals(""))
		{
			out.println("�������к�["+row+"]����[�೤����]Ϊ��");
			return;
		}

		sql=" select sgd" ;
		sql+=" from sq_sgd " ;
		sql+=" where sgdmc='"+sgdmc+"' and ssfgs='"+ssfgs+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			sgd = rs.getString("sgd");			    
		}
		else{
			out.println("�����������ڵ�[ʩ����]��"+sgdmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select bzmc" ;
		sql+=" from sq_bzxx " ;
		sql+=" where bzmc ='"+bzmc +"' and sgd='"+sgd+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			mark="<BR><font color=\"#FF0000\">���Ѵ��ڣ�</font>";
		}
		else{
			mark="";
		}
		rs.close();
		ps.close();

		sgdjbbm="";
		sql=" select sgdjbbm" ;
		sql+=" from sq_sgdjbbm " ;
		sql+=" where sgdjbmc='"+sgdjbmc+"' " ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			sgdjbbm = rs.getString("sgdjbbm");
		}
		rs.close();
		ps.close();



		if (!grsl.equals(""))
		{
			Double.parseDouble(grsl);
		}
		if (!yygrsl.equals(""))
		{
			Double.parseDouble(yygrsl);
		}
		if (!kygrsl.equals(""))
		{
			Double.parseDouble(kygrsl);
		}


		if (tdbzstr.equals("ͣ��"))//Y��ͣ����N��������K��������L����ְ
		{
			tdbz="Y";
		}
		else if (tdbzstr.equals("����"))
		{
			tdbz="N";
		}
		else if (tdbzstr.equals("����"))
		{
			tdbz="K";
		}
		else if (tdbzstr.equals("��ְ"))
		{
			tdbz="L";
		}
		else{
			out.println("�������೤["+bzmc+"]����[״̬]ֻ��Ϊ������/ͣ��/����/��ְ����ĿǰΪ["+tdbzstr+"]");
			return;
		}

		if (xbstr.equals("��"))
		{
			xb="M";
		}
		else if (xbstr.equals("Ů"))
		{
			xb="W";
		}
		else{
			xb="";
		}

		if (sfqldhtstr.equals("��"))
		{
			sfqldht="Y";
		}
		else if (sfqldhtstr.equals("��"))
		{
			sfqldht="N";
		}
		else{
			out.println("�������೤["+bzmc+"]����[�Ƿ�ǩ�Ͷ���ͬ]ֻ��Ϊ����/�񡿣�ĿǰΪ["+sfqldhtstr+"]");
			return;
		}

		if (sfsbxstr.equals("��"))
		{
			sfsbx="Y";
		}
		else if (sfsbxstr.equals("��"))
		{
			sfsbx="N";
		}
		else{
			out.println("�������೤["+bzmc+"]����[�Ƿ��ϱ���]ֻ��Ϊ����/�񡿣�ĿǰΪ["+sfsbxstr+"]");
			return;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=sgdmc%> 
        <input name="sgd" type="hidden" value="<%=sgd%>">
      </td>
      <td><%=bzmc%><%=mark%> 
        <input name="bzmc" type="hidden" value="<%=bzmc%>">
      </td>
      <td><%=sgdjbmc%>
        <input name="sgdjbbm" type="hidden" value="<%=sgdjbbm%>" >
      </td>
	  <td><%=grsl%>
        <input name="grsl" type="hidden" value="<%=grsl%>" >
      </td>
	  <td><%=yygrsl%>
        <input name="yygrsl" type="hidden" value="<%=yygrsl%>" >
      </td>
	  <td><%=kygrsl%>
        <input name="kygrsl" type="hidden" value="<%=kygrsl%>" >
      </td>
      <td> <%=tdbzstr%>
        <input name="tdbz" type="hidden" value="<%=tdbz%>" >
      </td>
      <td> <%=xbstr%>
        <input name="xb" type="hidden" value="<%=xb%>" >
      </td>
      <td> <%=dh%> 
        <input name="dh" type="hidden" value="<%=dh%>" >
      </td>
      <td ><%=zz%>
        <input name="zz" type="hidden" value="<%=zz%>" >
      </td>
      <td ><%=sfzh%>
        <input name="sfzh" type="hidden" value="<%=sfzh%>" >
      </td>
      <td ><%=sfqldhtstr%>
        <input name="sfqldht" type="hidden" value="<%=sfqldht%>" >
      </td>
      <td ><%=sfsbxstr%>
        <input name="sfsbx" type="hidden" value="<%=sfsbx%>" >
      </td>
      <td ><%=jjlxr%>
        <input name="jjlxr" type="hidden" value="<%=jjlxr%>" >
      </td>
      <td ><%=jjlxrdh%>
        <input name="jjlxrdh" type="hidden" value="<%=jjlxrdh%>" >
      </td>
      <td ><%=jjlxrdz%>
        <input name="jjlxrdz" type="hidden" value="<%=jjlxrdz%>" >
      </td>
      <td ><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	out.print("<BR>SQL=" + sql);
	out.print("<BR>bzmc =" + bzmc );
	return;
}
finally 
{
	try{
		f.close();
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����">
      ��������Ŀ����<%=row%>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
