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
String duihao=null;
String sgdjbbm=null;
String sgdjbmc=null;

String sgdlx=null;
String sgdlxdtr=null;
String sfzhm=null;
String dz=null;
String dh=null;
String email=null;
String hjszd=null;

String jjlxr=null;
String lxrdh=null;
String jjlxrdz=null;

String sfqldht=null;
String sfqldhtstr=null;
String zbj=null;
String bzs=null;

String tdbz=null;
String tdbzstr=null;

String tdkssj=null;
String tdzzsj=null;
String cxbz=null;
String cxbzstr=null;
String kjdsm=null;

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
 ����ʩ����<font color="#FF0000">[<%=fgsmc%>]
	<BR>���Ѵ��ڣ�������滻�������������</b></font>

  </div>
	<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
  <table width="270%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

	<tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%"><font color="#CC0000">*</font>ʩ���ӱ��(5λ)</td>
      <td width="3%"><font color="#CC0000">*</font>ʩ��������</td>
      <td width="2%">�Ӻ�</td>
	  <td width="3%">����</td>
      <td width="3%">ʩ��������</td>
      <td width="6%">���֤��</td>
      <td width="8%"><font color="#CC0000">*</font>סַ</td>
	  <td width="6%">�绰</td>
      <td width="5%">E-Mail</td>
      <td width="6%">�������ڵ�</td>
      <td width="3%">������ϵ��</td>
      <td width="6%">��ϵ�˵绰</td>
      <td width="5%">������ϵ�˵�ַ</td>
      <td width="3%">�Ƿ�ǩ�Ͷ���ͬ</td>
      <td width="3%">�ʱ���</td>
      <td width="3%">������</td>
      <td width="3%"><font color="#CC0000">*</font>ͣ����־</td>
      <td width="4%">ͣ����ʼʱ��</td>
      <td width="4%">ͣ����ֹʱ��</td>
      <td width="3%"><font color="#CC0000">*</font>������־</td>
      <td width="9%">�ɵ�˵��</td>
      <td width="9%">��ע</td>
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

		sgd=outStr[i][0].trim();
		sgdmc  =outStr[i][1].trim();
		duihao=outStr[i][2].trim();
		sgdjbmc=outStr[i][3].trim();
		sgdlxdtr=outStr[i][4].trim();
		sfzhm=outStr[i][5].trim();
		dz=outStr[i][6].trim();
		dh=outStr[i][7].trim();
		email=outStr[i][8].trim();
		hjszd=outStr[i][9].trim();
		jjlxr=outStr[i][10].trim();

		lxrdh=outStr[i][11].trim();
		jjlxrdz=outStr[i][12].trim();
		sfqldhtstr=outStr[i][13].trim();
		zbj=outStr[i][14].trim();
		bzs=outStr[i][15].trim();
		tdbzstr=outStr[i][16].trim();
		tdkssj=outStr[i][17].trim();
		tdzzsj=outStr[i][18].trim();
		cxbzstr=outStr[i][19].trim();
		kjdsm=outStr[i][20].trim();

		bz=outStr[i][21].trim();

		if (!tdkssj.equals(""))
		{
			java.sql.Date.valueOf(tdkssj);
		}
		if (!tdzzsj.equals(""))
		{
			java.sql.Date.valueOf(tdzzsj);
		}

		mark="";

		if (sgd.equals(""))
		{
			out.println("�������к�["+row+"]����[ʩ���ӱ��]Ϊ��");
			return;
		}

		sql=" select sgdjbbm" ;
		sql+=" from sq_sgdjbbm " ;
		sql+=" where sgdjbmc='"+sgdjbmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			sgdjbbm = rs.getString("sgdjbbm");			    
		}
		else{
			out.println("�����������ڵ�[����]��"+sgdjbmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select sgd" ;
		sql+=" from sq_sgd " ;
		sql+=" where sgdmc ='"+sgdmc +"' and ssfgs='"+ssfgs+"'" ;
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


		if (sgdlxdtr.equals("��ֱ����"))//S0����ֱ���ӣ�S1��ֱ���� 
		{
			sgdlx="S0";
		}
		else if (sgdlxdtr.equals("ֱ����"))
		{
			sgdlx="S1";
		}
		else{
			out.println("������ʩ����["+sgdmc+"]����[ʩ��������]ֻ��Ϊ����ֱ����/ֱ���ӡ���ĿǰΪ["+sgdlxdtr+"]");
			return;
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
			out.println("������ʩ����["+sgdmc+"]����[�Ƿ�ǩ�Ͷ���ͬ]ֻ��Ϊ����/�񡿣�ĿǰΪ["+sfqldhtstr+"]");
			return;
		}

		if (tdbzstr.equals("ͣ��"))//Y��ͣ����N����ͣ��
		{
			tdbz="Y";
		}
		else if (tdbzstr.equals("��ͣ��"))
		{
			tdbz="N";
		}
		else{
			out.println("������ʩ����["+sgdmc+"]����[ͣ����־]ֻ��Ϊ��ͣ��/��ͣ������ĿǰΪ["+tdbzstr+"]");
			return;
		}

		if (cxbzstr.equals("�ѳ���"))//Y���ѳ�����N��δ����
		{
			cxbz="Y";
		}
		else if (cxbzstr.equals("δ����"))
		{
			cxbz="N";
		}
		else{
			out.println("������ʩ����["+sgdmc+"]����[������־]ֻ��Ϊ���ѳ���/δ��������ĿǰΪ["+cxbzstr+"]");
			return;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=sgd%> 
        <input name="sgd" type="hidden" value="<%=sgd%>">
      </td>
      <td><%=sgdmc%><%=mark%> 
        <input name="sgdmc" type="hidden" value="<%=sgdmc%>">
      </td>
	  <td><%=duihao%>
        <input name="duihao" type="hidden" value="<%=duihao%>" >
      </td>
      <td><%=sgdjbmc%>
        <input name="sgdjbbm" type="hidden" value="<%=sgdjbbm%>" >
      </td>
	  <td><%=sgdlxdtr%>
        <input name="sgdlx" type="hidden" value="<%=sgdlx%>" >
      </td>
	  <td><%=sfzhm%>
        <input name="sfzhm" type="hidden" value="<%=sfzhm%>" >
      </td>
      <td> <%=dz%>
        <input name="dz" type="hidden" value="<%=dz%>" >
      </td>
      <td> <%=dh%>
        <input name="dh" type="hidden" value="<%=dh%>" >
      </td>
      <td> <%=email%> 
        <input name="email" type="hidden" value="<%=email%>" >
      </td>
      <td ><%=hjszd%>
        <input name="hjszd" type="hidden" value="<%=hjszd%>" >
      </td>
       <td ><%=jjlxr%>
        <input name="jjlxr" type="hidden" value="<%=jjlxr%>" >
      </td>
      <td ><%=lxrdh%>
        <input name="lxrdh" type="hidden" value="<%=lxrdh%>" >
      </td>
      <td ><%=jjlxrdz%>
        <input name="jjlxrdz" type="hidden" value="<%=jjlxrdz%>" >
      </td>
     <td ><%=sfqldhtstr%>
        <input name="sfqldht" type="hidden" value="<%=sfqldht%>" >
      </td>
      <td ><%=zbj%>
        <input name="zbj" type="hidden" value="<%=zbj%>" >
      </td>
      <td ><%=bzs%>
        <input name="bzs" type="hidden" value="<%=bzs%>" >
      </td>
      <td ><%=tdbzstr%>
        <input name="tdbz" type="hidden" value="<%=tdbz%>" >
      </td>
      <td ><%=tdkssj%>
        <input name="tdkssj" type="hidden" value="<%=tdkssj%>" >
      </td>
      <td ><%=tdzzsj%>
        <input name="tdzzsj" type="hidden" value="<%=tdzzsj%>" >
      </td>
      <td ><%=cxbzstr%>
        <input name="cxbz" type="hidden" value="<%=cxbz%>" >
      </td>
      <td ><%=kjdsm%>
        <input name="kjdsm" type="hidden" value="<%=kjdsm%>" >
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
	out.print("<BR>sgdmc =" + sgdmc );
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
