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

String dwbh = null;


String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String xuhao=null;
String clbm=null;
String clmc=null;
String clgg=null;
String jldwmc=null;
String xjgsxsj=null;

String xcj=null;
String xcjjsj=null;
String xfgsdj=null;
String xgdj=null;


String sfrkstr=null;
String sfrk=null;
String ckmc=null;

String sfycxstr=null;
String sfycx=null;
String cxkssj=null;
String cxjzsj=null;
String cxcj=null;
String cxcjjsj=null;
String cxfgsdj=null;
String cxgdj=null;

String dwmc="";
String dqbm="";

int count=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dwbh =up.getParameter("dwbh");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\fcgl\\cl_cljg\\impdata\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dwmc" ;
	sql+=" from sq_dwxx " ;
	sql+=" where dwbh='"+dwbh+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dwmc = rs.getString(1);			    
	}
	rs.close();
	ps.close();

	
	%> 
<form method="post" action="SaveImpAddData.jsp" name="editform" target="_blank">
  <div align="center">�����µĸ��ı��ۣ��ֹ�˾��<%=dwmc%>��</div>
<input name="dwbh" type="hidden" value="<%=dwbh%>" >
  <table width="140%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="3%">�к�</td>
      <td width="3%">�������</td>
      <td width="5%">���ϱ���</td>
	  <td width="9%">��������</td>
      <td width="8%">���Ϲ��</td>
      <td width="4%">������λ</td>
      <td width="5%">�¼۸���Чʱ��</td>
      <td width="5%">����</td>
      <td width="5%">�볧�ҽ����</td>
      <td width="5%">�ֹ�˾���ϵ���</td>
      <td width="5%">���Ӽ�</td>
      <td width="3%">�Ƿ����</td>
      <td width="7%">�ֿ�����</td>
      <td width="3%">�Ƿ��д���</td>
      <td width="5%">������ʼʱ��</td>
      <td width="5%">��������ʱ��</td>
      <td width="5%">�����ڳ���</td>
      <td width="5%">�������볧�ҽ����</td>
      <td width="5%">�����ڷֹ�˾���ϵ���</td>
      <td width="5%">�����ڹ��Ӽ�</td>
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


		xuhao=outStr[i][0].trim();
		clbm=outStr[i][1].trim();
		clmc=outStr[i][2].trim();
		clgg=outStr[i][3].trim();
		jldwmc=outStr[i][4].trim();
		xjgsxsj=outStr[i][5].trim();
		xcj=outStr[i][6].trim();
		xcjjsj=outStr[i][7].trim();
		xfgsdj=outStr[i][8].trim();
		xgdj=outStr[i][9].trim();

		sfrkstr=outStr[i][10].trim();
		ckmc=outStr[i][11].trim();

		sfycxstr=outStr[i][12].trim();
		cxkssj=outStr[i][13].trim();

		cxjzsj=outStr[i][14].trim();
		cxcj=outStr[i][15].trim();
		cxcjjsj=outStr[i][16].trim();
		cxfgsdj=outStr[i][17].trim();
		cxgdj=outStr[i][18].trim();

		if (clbm.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]����[���ϱ���]����Ϊ��");
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

		if (count==0)
		{
			out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[���ϱ���]��"+clbm);
			return;
		}

		//�¼۸���Чʱ��
		if (xjgsxsj==null || xjgsxsj.trim().equals(""))
		{
			out.print("���["+xuhao+"]����[�¼۸���Чʱ��]Ϊ��");
			return;
		}
		else{
			try{
				java.sql.Date.valueOf(xjgsxsj.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�¼۸���Чʱ��]�����ڣ�" + xjgsxsj);
				return;
			}
		}

		//����
		if (xcj==null || xcj.trim().equals(""))
		{
			out.print("���["+xuhao+"]����[����]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(xcj.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[����]�����֣�" + xcj);
				return;
			}
		}
		//�볧�ҽ����
		if (xcjjsj==null || xcjjsj.trim().equals(""))
		{
			out.print("���["+xuhao+"]����[�볧�ҽ����]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(xcjjsj.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�볧�ҽ����]�����֣�" + xcjjsj);
				return;
			}
		}
		//�·ֹ�˾���ϵ���
		if (xfgsdj==null || xfgsdj.trim().equals(""))
		{
			out.print("���["+xuhao+"]����[�·ֹ�˾���ϵ���]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(xfgsdj.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�·ֹ�˾���ϵ���]�����֣�" + xfgsdj);
				return;
			}
		}
		//�¹��Ӽ�
		if (xgdj==null || xgdj.trim().equals(""))
		{
			out.print("���["+xuhao+"]����[�¹��Ӽ�]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(xgdj.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�¹��Ӽ�]�����֣�" + xgdj);
				return;
			}
		}

		//�Ƿ����
		sfrk="N";
		if (sfrkstr!=null && !sfrkstr.equals(""))
		{
			if (sfrkstr.equals("��"))
			{
				sfrk="Y";
			}
			else if (sfrkstr.equals("��"))
			{
				sfrk="N";
			}
			else{
				out.println("<BR>���������["+xuhao+"]����[�Ƿ����]ֻ���ǡ��ǡ��򡾷񡿣�"+sfycxstr);
				return;
			}
		}
		//�ֿ�����
		if (ckmc==null || ckmc.trim().equals(""))
		{
			out.print("���["+xuhao+"]����[�ֿ�����]����Ϊ��");
			return;
		}

		//�Ƿ��д���
		sfycx="N";
		if (sfycxstr!=null && !sfycxstr.equals(""))
		{
			if (sfycxstr.equals("�д���"))
			{
				sfycx="Y";
			}
			else if (sfycxstr.equals("��"))
			{
				sfycx="N";
			}
			else{
				out.println("<BR>���������["+xuhao+"]����[�Ƿ��д���]ֻ���ǡ��д��������ޡ���"+sfycxstr);
				return;
			}
		}
		if (sfycx.equals("Y"))
		{
			//������ʼʱ��
			if (cxkssj==null || cxkssj.trim().equals(""))
			{
				out.print("���["+xuhao+"]����[������ʼʱ��]Ϊ��");
				return;
			}
			else{
				try{
					java.sql.Date.valueOf(cxkssj.trim());
				}
				catch (Exception e) {
					out.print("���["+xuhao+"]����[������ʼʱ��]�����ڣ�" + cxkssj);
					return;
				}
			}
			//��������ʱ��
			if (cxjzsj==null || cxjzsj.trim().equals(""))
			{
				out.print("���["+xuhao+"]����[��������ʱ��]Ϊ��");
				return;
			}
			else{
				try{
					java.sql.Date.valueOf(cxjzsj.trim());
				}
				catch (Exception e) {
					out.print("���["+xuhao+"]����[��������ʱ��]�����ڣ�" + cxjzsj);
					return;
				}
			}

			//�����ڳ���
			if (cxcj==null || cxcj.trim().equals(""))
			{
				out.print("���["+xuhao+"]����[�����ڳ���]����Ϊ��");
				return;
			}
			else{
				try{
					Double.parseDouble(cxcj.trim());
				}
				catch (Exception e) {
					out.print("���["+xuhao+"]����[�����ڳ���]�����֣�" + cxcj);
					return;
				}
			}
			//�������볧�ҽ����
			if (cxcjjsj==null || cxcjjsj.trim().equals(""))
			{
				out.print("���["+xuhao+"]����[�������볧�ҽ����]����Ϊ��");
				return;
			}
			else{
				try{
					Double.parseDouble(cxcjjsj.trim());
				}
				catch (Exception e) {
					out.print("���["+xuhao+"]����[�������볧�ҽ����]�����֣�" + cxcjjsj);
					return;
				}
			}
			//�����ڷֹ�˾���ϵ���
			if (cxfgsdj==null || cxfgsdj.trim().equals(""))
			{
				out.print("���["+xuhao+"]����[�����ڷֹ�˾���ϵ���]����Ϊ��");
				return;
			}
			else{
				try{
					Double.parseDouble(cxfgsdj.trim());
				}
				catch (Exception e) {
					out.print("���["+xuhao+"]����[�����ڷֹ�˾���ϵ���]�����֣�" + cxfgsdj);
					return;
				}
			}
			//�����ڹ��Ӽ�
			if (cxgdj==null || cxgdj.trim().equals(""))
			{
				out.print("���["+xuhao+"]����[�����ڹ��Ӽ�]����Ϊ��");
				return;
			}
			else{
				try{
					Double.parseDouble(cxgdj.trim());
				}
				catch (Exception e) {
					out.print("���["+xuhao+"]����[�����ڹ��Ӽ�]�����֣�" + cxgdj);
					return;
				}
			}
		}
		else{
			cxkssj="";
			cxjzsj="";
			cxcj="";
			cxcjjsj="";
			cxfgsdj="";
			cxgdj="";
		}
%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
      <td><%=xuhao%> 
        <input name="xuhao" type="hidden" value="<%=xuhao%>">
      </td>
      <td><%=clbm%> 
        <input name="clbm" type="hidden" value="<%=clbm%>">
      </td>
      <td><%=clmc%>
      </td>
      <td><%=clgg%>
      </td>
      <td><%=jldwmc%>
      </td>
      <td><%=xjgsxsj%>
        <input name="xjgsxsj" type="hidden" value="<%=xjgsxsj%>" >
      </td>
	  <td ><%=xcj%>
        <input name="xcj" type="hidden" value="<%=xcj%>" >
      </td>
      <td><%=xcjjsj%>
        <input name="xcjjsj" type="hidden" value="<%=xcjjsj%>" >
      </td>
	  <td><%=xfgsdj%>
        <input name="xfgsdj" type="hidden" value="<%=xfgsdj%>" >
      </td>
      <td><%=xgdj%>
        <input name="xgdj" type="hidden" value="<%=xgdj%>" >
      </td>
      <td><%=sfrkstr%>
        <input name="sfrk" type="hidden" value="<%=sfrk%>" >
      </td>
      <td><%=ckmc%>
        <input name="ckmc" type="hidden" value="<%=ckmc%>" >
      </td>
      <td><%=sfycxstr%>
        <input name="sfycx" type="hidden" value="<%=sfycx%>" >
      </td>
      <td><%=cxkssj%>
        <input name="cxkssj" type="hidden" value="<%=cxkssj%>" >
      </td>
      <td><%=cxjzsj%>
        <input name="cxjzsj" type="hidden" value="<%=cxjzsj%>" >
      </td>
      <td><%=cxcj%>
        <input name="cxcj" type="hidden" value="<%=cxcj%>" >
      </td>
      <td><%=cxcjjsj%>
        <input name="cxcjjsj" type="hidden" value="<%=cxcjjsj%>" >
      </td>
      <td><%=cxfgsdj%>
        <input name="cxfgsdj" type="hidden" value="<%=cxfgsdj%>" >
      </td>
      <td><%=cxgdj%>
        <input name="cxgdj" type="hidden" value="<%=cxgdj%>" >
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
