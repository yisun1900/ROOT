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

String[][] outStr=null; 
String bgcolor=null;

String kpxmbm=null;
String kpxmmc=null;
String kpdlbm=null;
String kpdlmc=null;

String kpjg=null;
String kpjgstr=null;
String kpjgdy=null;
String kpcfbm=null;
String kpcfmc=null;
String cfbz=null;
String kf=null;
String sgdfk=null;
String kcjdebl=null;

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


	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();



	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    ����ʩ����Υ����Ŀ
	<BR>���Ѵ��ڣ�������滻�������������</b></font>
  </div>
  <table width="150%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

	<tr bgcolor="#CCCCCC" align="center"> 
      <td width="4%"><font color="#CC0000">*</font>��Ŀ����</td>
      <td width="5%"><font color="#CC0000">*</font>Υ����Ŀ����</td>
	  <td width="15%"><font color="#CC0000">*</font>Υ����Ŀ����</td>
	  <td width="5%"><font color="#CC0000">*</font>Υ��ּ�</td>
	  <td width="24%">Υ��ּ�����</td>
	  <td width="4%"><font color="#CC0000">*</font>�۷�</td>
	  <td width="4%"><font color="#CC0000">*</font>����</td>
	  <td width="4%"><font color="#CC0000">*</font>�۳��ӵ���ٷֱ�</td>
	  <td width="6%">��������</td>
	  <td width="29%">������׼</td>
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

		kpdlmc=outStr[i][0].trim();
		kpxmbm  =outStr[i][1].trim();
		kpxmmc=outStr[i][2].trim();
		kpjgstr=outStr[i][3].trim();
		kpjgdy=outStr[i][4].trim();
		kf=outStr[i][5].trim();
		sgdfk=outStr[i][6].trim();
		kcjdebl=outStr[i][7].trim();
		kpcfmc=outStr[i][8].trim();
		cfbz=outStr[i][9].trim();


		mark="";

		if (kpxmmc.equals(""))
		{
			out.println("�������к�["+row+"]����[Υ����Ŀ����]Ϊ��");
			return;
		}

		sql=" select kpdlbm" ;
		sql+=" from kp_kpdlbm " ;
		sql+=" where kpdlmc='"+kpdlmc+"' " ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			kpdlbm = rs.getString("kpdlbm");			    
		}
		else{
			out.println("�����������ڵ�[��Ŀ����]��"+kpdlmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select yzcdbm" ;
		sql+=" from kp_sgdyzcdbm " ;
		sql+=" where ydcdmc ='"+kpjgstr +"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			kpjg = rs.getString("yzcdbm");			    
		}
		else{
			out.println("�����������ڵ�[Υ��ּ�]��"+kpjgstr);
			return;
		}
		rs.close();
		ps.close();


		if (!kpcfmc.equals(""))
		{
			sql=" select kpcfbm" ;
			sql+=" from kp_kpcfbm " ;
			sql+=" where kpcfmc ='"+kpcfmc +"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				kpcfbm = rs.getString("kpcfbm");			    
			}
			else{
				out.println("�����������ڵ�[��������]��"+kpcfmc);
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			kpcfbm="";
		}

		sql=" select kpxmbm" ;
		sql+=" from kp_gckpxm " ;
		sql+=" where kpxmbm ='"+kpxmbm+"' and kpjg ='"+kpjg+"'" ;
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

		if (!kf.equals(""))
		{
			Double.parseDouble(kf);
		}
		else{
			kf="0";
		}
		if (!sgdfk.equals(""))
		{
			Double.parseDouble(sgdfk);
		}
		else{
			sgdfk="0";
		}
		if (!kcjdebl.equals(""))
		{
			Double.parseDouble(kcjdebl);
		}
		else{
			kcjdebl="0";
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=kpdlmc%> 
        <input name="kpdlbm" type="hidden" value="<%=kpdlbm%>">
      </td>
      <td><%=kpxmbm%> 
        <input name="kpxmbm" type="hidden" value="<%=kpxmbm%>">
      </td>
      <td><%=kpxmmc%><%=mark%>
        <input name="kpxmmc" type="hidden" value="<%=kpxmmc%>" >
      </td>
	  <td><%=kpjgstr%>
        <input name="kpjg" type="hidden" value="<%=kpjg%>" >
      </td>
	  <td align="left"><%=kpjgdy%>
        <input name="kpjgdy" type="hidden" value="<%=kpjgdy%>" >
      </td>
      <td> <%=kf%>
        <input name="kf" type="hidden" value="<%=kf%>" >
      </td>
      <td> <%=sgdfk%> 
        <input name="sgdfk" type="hidden" value="<%=sgdfk%>" >
      </td>
      <td ><%=kcjdebl%>
        <input name="kcjdebl" type="hidden" value="<%=kcjdebl%>" >
      </td>
	  <td><%=kpcfmc%>
        <input name="kpcfbm" type="hidden" value="<%=kpcfbm%>" >
      </td>
      <td align="left"> <%=cfbz%>
        <input name="cfbz" type="hidden" value="<%=cfbz%>" >
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	out.print("<BR>SQL=" + sql);
	out.print("<BR>kpxmmc=" + kpxmmc );
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
