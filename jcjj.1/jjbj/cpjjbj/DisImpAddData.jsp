<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�����µĳ�Ʒ�Ҿ߱���</title>
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

String dqbm = null;


String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String cpjjbh=null;
String cpjjfg=null;
String cpjjmc=null;
String xh=null;
String gg=null;
String cpjjxl=null;
String cpjjcz=null;
String djstr=null;
double dj=0;
String bz=null;
String cpsm=null;
String cktp=null;
String cptp=null;


String dqmc="";

int count=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameter("dqbm");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\jcjj\\jjbj\\impdata\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dqmc" ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString(1);			    
	}
	rs.close();
	ps.close();

	
	%> 
<form method="post" action="SaveImpAddData.jsp" name="editform" target="_blank">
  <div align="center">�����µĳ�Ʒ�Ҿ߱��ۣ�������<%=dqmc%>��</div>
<input name="dqbm" type="hidden" value="<%=dqbm%>" >
  <table width="170%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">��Ʒ�Ҿ߱��</td>
	  <td width="5%">���</td>
      <td width="5%">����</td>
      <td width="4%">�ͺ�</td>
      <td width="7%">���</td>
      <td width="6%">ϵ��</td>
      <td width="7%">����</td>
      <td width="4%">����</td>
      <td width="9%">��ע</td>
      <td width="36%">��Ʒ˵��</td>
      <td width="6%">�ο�ͼƬ</td>
      <td width="6%">��ƷͼƬ</td>
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
			out.println("����!��"+i+"��[��Ʒ�Ҿ߱��]Ϊ��,����������Զ�������");
			break;
		}


		cpjjbh=outStr[i][0].trim();
		cpjjfg=outStr[i][1].trim();
		cpjjmc=outStr[i][2].trim();
		xh=outStr[i][3].trim();
		gg=outStr[i][4].trim();
		cpjjxl=outStr[i][5].trim();
		cpjjcz=outStr[i][6].trim();
		djstr=outStr[i][7].trim();
		bz=outStr[i][8].trim();
		cpsm=outStr[i][9].trim();

		cktp=outStr[i][10].trim();
		cptp=outStr[i][11].trim();

		if (cpjjcz.equals(""))
		{
			out.println("<BR>��������Ʒ�Ҿ߱��["+cpjjbh+"]�����������Ʋ���Ϊ��");
			return;
		}

		//���
		if (cpjjfg!=null && !cpjjfg.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jdm_cpjjfg " ;
			sql+=" where cpjjfg='"+cpjjfg+"'" ;
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
				out.println("<BR>��������Ʒ�Ҿ߱��["+cpjjbh+"]���󣬲����ڵ�[���]��"+cpjjfg);
				return;
			}
		}
		else{
			out.println("<BR>��������Ʒ�Ҿ߱��["+cpjjbh+"]����[���]����Ϊ��");
			return;
		}
		//����
		if (cpjjmc!=null && !cpjjmc.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jdm_cpjjmc " ;
			sql+=" where cpjjmc='"+cpjjmc+"'" ;
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
				out.println("<BR>��������Ʒ�Ҿ߱��["+cpjjbh+"]���󣬲����ڵ�[����]��"+cpjjmc);
				return;
			}
		}
		else{
			out.println("<BR>��������Ʒ�Ҿ߱��["+cpjjbh+"]����[����]����Ϊ��");
			return;
		}
		//ϵ��
		if (cpjjxl!=null && !cpjjxl.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jdm_cpjjxl " ;
			sql+=" where cpjjxl='"+cpjjxl+"'" ;
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
				out.println("<BR>��������Ʒ�Ҿ߱��["+cpjjbh+"]���󣬲����ڵ�[ϵ��]��"+cpjjxl);
				return;
			}
		}
		else{
			out.println("<BR>��������Ʒ�Ҿ߱��["+cpjjbh+"]����[ϵ��]����Ϊ��");
			return;
		}
		//����
		if (cpjjcz!=null && !cpjjcz.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jdm_cpjjcz " ;
			sql+=" where cpjjcz='"+cpjjcz+"'" ;
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
				out.println("<BR>��������Ʒ�Ҿ߱��["+cpjjbh+"]���󣬲����ڵ�[����]��"+cpjjcz);
				return;
			}
		}
		else{
			out.println("<BR>��������Ʒ�Ҿ߱��["+cpjjbh+"]����[����]����Ϊ��");
			return;
		}



		//����
		dj=0;
		if (djstr!=null && !djstr.trim().equals(""))
		{
			try{
				dj=Double.parseDouble(djstr.trim());
			}
			catch (Exception e) {
				out.print("��Ʒ�Ҿ߱��["+cpjjbh+"]����[����]�����֣�" + djstr);
				return;
			}
		}
		else{
			out.println("<BR>��������Ʒ�Ҿ߱��["+cpjjbh+"]����[����]����Ϊ��");
			return;
		}


%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=cpjjbh%> 
        <input name="cpjjbh" type="hidden" value="<%=cpjjbh%>">
      </td>
      <td><%=cpjjfg%> 
        <input name="cpjjfg" type="hidden" value="<%=cpjjfg%>">
      </td>
      <td><%=cpjjmc%>
        <input name="cpjjmc" type="hidden" value="<%=cpjjmc%>" >
      </td>
      <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
	  <td ><%=cpjjxl%>
        <input name="cpjjxl" type="hidden" value="<%=cpjjxl%>" >
      </td>
      <td><%=cpjjcz%>
        <input name="cpjjcz" type="hidden" value="<%=cpjjcz%>" >
      </td>
      <td><%=djstr%>
        <input name="dj" type="hidden" value="<%=djstr%>" >
      </td>
	  <td align="left"><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
      <td align="left"><%=cpsm%>
        <input name="cpsm" type="hidden" value="<%=cpsm%>" >
      </td>
      <td><%=cktp%>
        <input name="cktp" type="hidden" value="<%=cktp%>" >
      </td>
      <td ><%=cptp%>
        <input name="cptp" type="hidden" value="<%=cptp%>" >
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("��Ʒ�Ҿ߱��["+cpjjbh+"]����" + e);
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
//	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
