<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�����µĸ��ı���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">

<%

ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;



String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String xuhao=null;
String cldlmc=null;
String clbm=null;
String clmc=null;
String clgg=null;
String jldwmc=null;
String lx=null;
String lxstr=null;
String paixu=null;
String bz=null;


String xjgsxsj=null;

String xcj=null;
String xcjjsj=null;
String xfgsdj=null;
String xgdj=null;


String sfrkstr=null;
String sfrk=null;

String sfycxstr=null;
String sfycx=null;
String cxkssj=null;
String cxjzsj=null;
String cxcj=null;
String cxcjjsj=null;
String cxfgsdj=null;
String cxgdj=null;

String cjjsj=null;
String gdj=null;
String ckmc=null;

String dqbm="";

int count=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\fcgl\\cl_cljg\\impdata\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	
	%> 
<form method="post" action="SaveImpAddDataJg.jsp" name="editform" target="_blank">
  <div align="center">�����µĸ��ı���</div>
  <table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="3%">�к�</td>
      <td width="8%">���ϴ���</td>
      <td width="6%">���ϱ���</td>
	  <td width="16%">��������</td>
      <td width="9%">���Ϲ��</td>
      <td width="6%">������λ</td>
      <td width="6%">�Ƿ���</td>
      <td width="14%">��ע</td>
      <td width="5%">���</td>
      <td width="5%">�ɱ���</td>
      <td width="5%">�Թ�����</td>
      <td width="25%">��Ӧ��</td>
	
	</tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


	int row=0;
	for (int i=1;i<outStr.length ;i++ )
	{
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][0]==null || outStr[i][0].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}


		cldlmc=outStr[i][0].trim();
		clbm=outStr[i][1].trim();
		clmc=outStr[i][2].trim();
		clgg=outStr[i][3].trim();
		jldwmc=outStr[i][4].trim();
		lxstr=outStr[i][5].trim();
		bz=outStr[i][6].trim();
		paixu=outStr[i][7].trim();
		cjjsj=outStr[i][8].trim();
		gdj=outStr[i][9].trim();
		ckmc=outStr[i][10].trim();


		if (clbm.equals(""))
		{
			out.println("<BR>�������к�["+row+"]����[���ϱ���]����Ϊ��");
			return;
		}

		//�볧�ҽ����
		if (cjjsj==null || cjjsj.trim().equals(""))
		{
			out.print("���["+xuhao+"]����[�ɱ���]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(cjjsj.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�ɱ���]�����֣�" + cjjsj);
				return;
			}
		}

		//�¹��Ӽ�
		if (gdj==null || gdj.trim().equals(""))
		{
			out.print("���["+xuhao+"]����[�Թ�����]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(gdj.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�Թ�����]�����֣�" + gdj);
				return;
			}
		}

		sql=" select count(*)" ;
		sql+=" from cl_cldlbm " ;
		sql+=" where cldlmc='"+cldlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			out.println("<BR>�������к�["+row+"]���󣬲����ڵ�[���ϴ���]��"+cldlmc);
			return;
		}

		sql=" select count(*)" ;
		sql+=" from cl_clbm " ;
		sql+=" where clbm='"+clbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("<BR>�������к�["+row+"]����[���ϱ���]�Ѵ��ڣ�"+clbm);
			return;
		}


		sql=" select count(*)" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+jldwmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			out.println("<BR>�������к�["+row+"]���󣬲����ڵ�[������λ]��"+jldwmc);
			return;
		}

		if (lxstr.equals(""))
		{
			lx="2";
		}
		else if (lxstr.equals("����"))
		{
			lx="1";
		}
		else if (lxstr.equals("�ǳ���"))
		{
			lx="2";
		}
		else{
			out.println("�������к�["+row+"]����[�Ƿ���]ֻ��Ϊ�����á��ǳ��á���ĿǰΪ["+lxstr+"]");
			return;
		}
%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
      <td><%=cldlmc%> 
        <input name="cldlmc" type="hidden" value="<%=cldlmc%>">
      </td>
      <td><%=clbm%> 
        <input name="clbm" type="hidden" value="<%=clbm%>">
      </td>
      <td><%=clmc%> 
        <input name="clmc" type="hidden" value="<%=clmc%>">
      </td>
      <td><%=clgg%> 
        <input name="clgg" type="hidden" value="<%=clgg%>">
      </td>
      <td><%=jldwmc%> 
        <input name="jldwmc" type="hidden" value="<%=jldwmc%>">
      </td>
      <td><%=lxstr%>
        <input name="lx" type="hidden" value="<%=lx%>" >
      </td>
	  <td ><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
      <td><%=paixu%>
        <input name="paixu" type="hidden" value="<%=paixu%>" >
      </td>
      <td><%=cjjsj%>
        <input name="cjjsj" type="hidden" value="<%=cjjsj%>" >
      </td>
      <td><%=gdj%>
        <input name="gdj" type="hidden" value="<%=gdj%>" >
      </td>
      <td><%=ckmc%>
        <input name="ckmc" type="hidden" value="<%=ckmc%>" >
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("���["+xuhao+"]����" + e);
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
        <input type="button"  value="����" name="bc" onClick="f_do(editform)">
      </td>
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
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
