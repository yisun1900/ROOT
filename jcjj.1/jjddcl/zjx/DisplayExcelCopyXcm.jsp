<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>����Excel�ļ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxxh=request.getParameter("zjxxh");

String dataStr=cf.GB2Uni(request.getParameter("dataStr"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

 %>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="250%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="left" > 
        <b>��������ţ�<%=zjxxh%><P>���鿽����Excel�ļ��Ƿ���ȷ����������������¿���
			<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
		<input name="ddbh" type="hidden" value="<%=ddbh%>">
          <input name="button" type="button" onClick="f_do(editform)"  value="����">
          <input name="czfs" type="radio" value="2" checked>
          �������Ͳ���</td>
    </tr>
    <tr>
      <td>
	 <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
			<tr bgcolor="#CCCCCC"  align="center">
			  <td width="3%" rowspan="2">�Ͳ�������</td>
			  <td width="3%" rowspan="2">�Ͳ�������</td>
			  <td width="3%" rowspan="2">��װλ��</td>
			  <td width="6%" rowspan="2" align="left">&nbsp;&nbsp;<strong>������</strong>���߿��ͺ�<BR>
&nbsp;&nbsp;<strong>����</strong>������<BR>
&nbsp;&nbsp;<strong>����</strong>������<BR>
&nbsp;&nbsp;<strong>�������</strong>������</td>
			  <td width="3%" rowspan="2">�߿���ɫ</td>
			  <td width="3%" rowspan="2">�����շ�</td>
			  <td width="3%" rowspan="2">�ܸ߶�(mm)</td>
			  <td width="3%" rowspan="2">�ܿ��(mm)</td>
			  <td width="3%" rowspan="2"><span class="STYLE1">�ܼ�</span></td>
			  <td colspan="8"><strong>���һ</strong></td>
			  <td colspan="8"><strong>����</strong></td>
			  <td width="16%" rowspan="2">��ע</td>
		  </tr>
			<tr bgcolor="#CCCCCC"  align="center"> 
				<td  width="2%">����</td>
				<td  width="6%" align="left">&nbsp;&nbsp;<strong>������</strong>������<BR>
	  &nbsp;&nbsp;<strong>����</strong>����ɫ<BR>
	  &nbsp;&nbsp;<strong>����</strong>����ɫ<BR>
	  &nbsp;&nbsp;<strong>�������</strong>������</td>
				<td  width="6%">о������</td>
				<td  width="2%">�߶�(mm)</td>
				<td  width="2%">���(mm)</td>
				<td  width="3%">�Ƽ۷�ʽ</td>
				<td  width="3%"><span class="STYLE1">ƽ�׵���</span></td>
				<td  width="3%"><span class="STYLE1">���׵���</span></td>
				<td  width="2%">����</td>
				<td  width="6%" align="left">&nbsp;&nbsp;<strong>������</strong>������<BR>
	  &nbsp;&nbsp;<strong>����</strong>����ɫ<BR>
	  &nbsp;&nbsp;<strong>����</strong>����ɫ<BR>
	  &nbsp;&nbsp;<strong>�������</strong>������</td>
				<td  width="6%">о������</td>
				<td  width="2%">�߶�(mm)</td>
				<td  width="2%">���(mm)</td>
				<td  width="3%">�Ƽ۷�ʽ</td>
				<td  width="3%"><span class="STYLE1">ƽ�׵���</span></td>
				<td  width="3%"><span class="STYLE1">���׵���</span></td>
			</tr>
<%

	String[] lineStr=dataStr.split("\r\n");
	if (lineStr==null || lineStr.length<2)
	{
		out.println("<BR>����δ¼�뱨������");
		return;
	}

	//�����˳���Ƿ���ȷ��������������������������������ʼ
	String rowData=lineStr[0];
	String[] colStr=rowData.split("	");
	if (colStr==null || colStr.length!=17)
	{
		out.println("<BR>�������������㣬Ӧ����17�У�ʵ���У�"+colStr.length);
		return;
	}



	//ȡ���ݣ�������������������������������ʼ
	for (int i=1;i<lineStr.length ;i++ )
	{
		rowData=lineStr[i];
		colStr=rowData.split("	",17);
		if (colStr==null || colStr.length<16)
		{
			out.println("<BR>��["+(i+1)+"]�д������������㣬Ӧ����17�У��������ݱ�������ʵ���У�"+colStr.length);
			return;
		}

		String xcmlxmc=colStr[0].trim();
		String xcmmc=colStr[1].trim();
		String azwz=colStr[2].trim();
		String bklxxh=colStr[3].trim();
		String bkys=colStr[4].trim();
		String qtsfStr=colStr[5].trim();
		String gdStr=colStr[6].trim();
		String kdStr=colStr[7].trim();
		String mbcl1=colStr[8].trim();
		String xbpz1=colStr[9].trim();
		String gd1Str=colStr[10].trim();
		String kd1Str=colStr[11].trim();
		String mbcl2=colStr[12].trim();
		String xbpz2=colStr[13].trim();
		String gd2Str=colStr[14].trim();
		String kd2Str=colStr[15].trim();
		String bz=null;
		if (colStr.length==17)
		{
			bz=colStr[16].trim();
		}
		else{
			bz="";
		}


		//���[������]���Ƿ���ȷ��������������������������������ʼ

		//[������]�Ƿ����
		String getazwz=null;
		String getjjpjflbm=null;
		String getqtsfStr=null;
		String getbklxxh=null;
		String getbkys=null;
		double getPmdj=0;

		String xcmlxbm=null;
		ls_sql="SELECT xcmlxbm";
		ls_sql+=" FROM jdm_xcmlxbm";
		ls_sql+=" where xcmlxmc='"+xcmlxmc+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xcmlxbm=rs.getString("xcmlxbm");
		}
		rs.close();
		ps.close();
		if (xcmlxbm==null)
		{
			out.println("<BR>��["+(i+1)+"]�д��󣡡��Ͳ������ͣ�"+xcmlxmc+"��������");
			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jdm_bgmazwzbm";
		ls_sql+=" where bgmazwzmc='"+azwz+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			out.println("<BR>��["+(i+1)+"]�д��󣡡���װλ�ã�"+azwz+"��������");
			return;
		}

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jc_bgmbj";
		ls_sql+=" where bklxxh='"+bklxxh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			out.println("<BR>��["+(i+1)+"]�д��󣡡��߿��ͺ�/����/���ͣ�"+bklxxh+"��������");
			return;
		}

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jdm_bgmbkysbm";
		ls_sql+=" where bgmbkysmc='"+bkys+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			out.println("<BR>��["+(i+1)+"]�д��󣡡��߿���ɫ��"+bkys+"��������");
			return;
		}

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jc_bgmbj";
		ls_sql+=" where mbcl='"+mbcl1+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			out.println("<BR>��["+(i+1)+"]�д��󣡡����һ����/��ɫ��"+mbcl1+"��������");
			return;
		}

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jc_bgmbj";
		ls_sql+=" where mbcl='"+mbcl1+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			out.println("<BR>��["+(i+1)+"]�д��󣡡���������/��ɫ��"+mbcl1+"��������");
			return;
		}



		double qtsf=0;
		if (!qtsfStr.equals(""))
		{
			try{
				qtsf=Double.parseDouble(qtsfStr);
			}
			catch (Exception e){
				out.println("<BR>��["+(i+1)+"]�д���[�����շ�]�������֣�"+qtsfStr);
				return;
			}
		}

		int gd=0;
		try{
			gd=Integer.parseInt(gdStr);
		}
		catch (Exception e){
			out.println("<BR>��["+(i+1)+"]�д���[�ܸ߶�]�������֣�"+gdStr);
			return;
		}
		int kd=0;
		try{
			kd=Integer.parseInt(kdStr);
		}
		catch (Exception e){
			out.println("<BR>��["+(i+1)+"]�д���[�ܿ��]�������֣�"+kdStr);
			return;
		}

		int gd1=0;
		try{
			gd1=Integer.parseInt(gd1Str);
		}
		catch (Exception e){
			out.println("<BR>��["+(i+1)+"]�д���[���һ�߶�]�������֣�"+gd1Str);
			return;
		}

		int kd1=0;
		try{
			kd1=Integer.parseInt(kd1Str);
		}
		catch (Exception e){
			out.println("<BR>��["+(i+1)+"]�д���[���һ���]�������֣�"+kd1Str);
			return;
		}


		int gd2=0;
		if (!gd2Str.equals(""))
		{
			try{
				gd2=Integer.parseInt(gd2Str);
			}
			catch (Exception e){
				out.println("<BR>��["+(i+1)+"]�д���[�����߶�]�������֣�"+gd2Str);
				return;
			}
		}

		int kd2=0;
		if (!kd2Str.equals(""))
		{
			try{
				kd2=Integer.parseInt(kd2Str);
			}
			catch (Exception e){
				out.println("<BR>��["+(i+1)+"]�д���[�������]�������֣�"+kd2Str);
				return;
			}
		}

		double mj1=cf.round(gd1/1000.0*kd1/1000.0,6);
		double mj2=cf.round(gd2/1000.0*kd2/1000.0,6);
		double zmj=cf.round(gd/1000.0*kd/1000.0,6);

		if (!mbcl1.equals("") && !mbcl2.equals(""))
		{
			if (zmj==mj1)
			{
				out.println("���������ֲ���,[����1]������ܵ����������");
				return;
			}
			if (zmj==mj2)
			{
				out.println("���������ֲ���,[����2]������ܵ����������");
				return;
			}
		}

		//��������
		if (zmj!=cf.round(mj1+mj2,6))
		{
			out.println("����[����1���]+[����2���]="+(mj1+mj2)+"��������[�����]��"+zmj+"��");
			return;
		}
		
		double pmdj1=0;
		double ymdj1=0;
		String ymdj1Str=null;
		String xcmbm1=null;
		String jjfs1=null;
		String jjfsmc1=null;
		String zsxt=null;
		String bjbz=null;
		ls_sql="select xcmbm,pmdj,ymdj,jjfs,zsxt,bz";
		ls_sql+=" from jc_bgmbj";
		if (xbpz1.equals(""))
		{
			ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl1+"' and xbpz is null";
		}
		else{
			ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl1+"' and xbpz='"+xbpz1+"'";
		}

		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next())
		{  
			xcmbm1=rs.getString("xcmbm");
			pmdj1=rs.getDouble("pmdj");
			ymdj1=rs.getDouble("ymdj");
			jjfs1=rs.getString("jjfs");
			zsxt=cf.fillNull(rs.getString("zsxt"));
			bjbz=cf.fillNull(rs.getString("bz"));
		}
		else{
			out.println("<BR>��["+(i+1)+"]�д���[���һ����]�����ڣ�������[�߿�ϵ���ͺ�]��[���һ����]����ȷ��SQL="+ls_sql);
			return;
		}
		rs.close();
		ps.close();

		if (jjfs1.equals("1"))
		{
			jjfsmc1="ƽ�׵���";

			if (pmdj1==0)
			{
				out.println("<BR>��["+(i+1)+"]�д���[ƽ�׵���]����Ϊ0");
				return;
			}
			ymdj1Str="";

			if (ymdj1!=0)
			{
				out.println("<BR>��["+(i+1)+"]�д���[���׵���]Ӧ��Ϊ0");
				return;
			}
		}
		else if (jjfs1.equals("2"))
		{
			jjfsmc1="ƽ�׵���+������׵���";

			if (pmdj1==0)
			{
				out.println("<BR>��["+(i+1)+"]�д���[ƽ�׵���]����Ϊ0");
				return;
			}

			ymdj1Str=""+ymdj1;

			if (ymdj1==0)
			{
				out.println("<BR>��["+(i+1)+"]�д���[���׵���]����Ϊ0");
				return;
			}
		}
		else{
			jjfsmc1="";

			ymdj1Str="";
		}

		double pmdj2=0;
		double ymdj2=0;
		String pmdj2Str=null;
		String ymdj2Str=null;
		String xcmbm2="";
		String jjfs2="";
		String jjfsmc2="";
		if (!mbcl2.equals(""))
		{
			ls_sql="select xcmbm,pmdj,ymdj,jjfs";
			ls_sql+=" from jc_bgmbj";
			if (xbpz2.equals(""))
			{
				ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl2+"' and xbpz is null";
			}
			else{
				ls_sql+=" where  xcmlxbm='"+xcmlxbm+"' and bklxxh='"+bklxxh+"' and mbcl='"+mbcl2+"' and xbpz='"+xbpz2+"'";
			}
			ps=conn.prepareStatement(ls_sql);  
			rs=ps.executeQuery();  
			if (rs.next())
			{  
				xcmbm2=rs.getString("xcmbm");
				pmdj2=rs.getDouble("pmdj");
				ymdj2=rs.getDouble("ymdj");
				jjfs2=rs.getString("jjfs");
			}
			else{
				out.println("<BR>��["+(i+1)+"]�д���[��������]�����ڣ�������[�߿�ϵ���ͺ�]��[��������]����ȷ��SQL="+ls_sql);
				return;
			}
			rs.close();
			ps.close();
		}

		if (jjfs2.equals("1"))
		{
			jjfsmc2="ƽ�׵���";

			if (pmdj2==0)
			{
				out.println("<BR>��["+(i+1)+"]�д���[ƽ�׵���]����Ϊ0");
				return;
			}

			pmdj2Str=""+pmdj2;
			ymdj2Str="";

			if (ymdj2!=0)
			{
				out.println("<BR>��["+(i+1)+"]�д���[���׵���]Ӧ��Ϊ0");
				return;
			}
		}
		else if (jjfs2.equals("2"))
		{
			jjfsmc2="ƽ�׵���+������׵���";

			if (pmdj2==0)
			{
				out.println("<BR>��["+(i+1)+"]�д���[ƽ�׵���]����Ϊ0");
				return;
			}

			pmdj2Str=""+pmdj2;
			ymdj2Str=""+ymdj2;

			if (ymdj2==0)
			{
				out.println("<BR>��["+(i+1)+"]�д���[���׵���]����Ϊ0");
				return;
			}
		}
		else{
			jjfsmc2="";

			pmdj2Str="";
			ymdj2Str="";
		}

		double je1=0;
		if (jjfs1.equals("1"))//1��ƽ�׵��ۣ�2��ƽ�׵��ۣ�������׵���
		{
			je1=mj1*pmdj1;
		}
		else{
			double zc=(gd1/1000.0+kd1/1000.0)*2;
			je1=mj1*pmdj1+zc*ymdj1;
		}

		double je2=0;
		if (jjfs2.equals("1"))//1��ƽ�׵��ۣ�2��ƽ�׵��ۣ�������׵���
		{
			je2=mj2*pmdj2;
		}
		else{
			double zc=(gd2/1000.0+kd2/1000.0)*2;
			je2=mj2*pmdj2+zc*ymdj2;
		}

		double zqje=cf.round(je1+je2+qtsf,2);
		if (zqje==0)
		{
			out.println("<BR>��["+(i+1)+"]�д���[�ܼ�]����Ϊ0");
			return;
		}


		%>
		<tr align="center" bgcolor="#FFFFFF"> 
			<td><input name="xcmlxbm" type="hidden" value="<%=xcmlxbm%>"><%=xcmlxmc%></td>
			<td><input name="xcmmc" type="hidden" value="<%=xcmmc%>"><%=xcmmc%></td>
			<td><input name="azwz" type="hidden" value="<%=azwz%>"><%=azwz%></td>
			<td><input name="bklxxh" type="hidden" value="<%=bklxxh%>"><%=bklxxh%></td>
			<td><input name="bkys" type="hidden" value="<%=bkys%>"><%=bkys%></td>
			<td><input name="qtsf" type="hidden" value="<%=qtsf%>"><%=qtsfStr%></td>
			<td><input name="gd" type="hidden" value="<%=gd%>"><%=gd%></td>
			<td><input name="kd" type="hidden" value="<%=kd%>"><%=kd%></td>
			<td><input name="zqje" type="hidden" value="<%=zqje%>"><%=zqje%></td>
			<td><input name="xcmbm1" type="hidden" value="<%=xcmbm1%>"><%=xcmbm1%></td>
			<td><input name="mbcl1" type="hidden" value="<%=mbcl1%>"><%=mbcl1%></td>
			<td><input name="xbpz1" type="hidden" value="<%=xbpz1%>"><%=xbpz1%></td>
			<td><input name="gd1" type="hidden" value="<%=gd1%>"><%=gd1%></td>
			<td><input name="kd1" type="hidden" value="<%=kd1%>"><%=kd1%>
			<input name="mj1" type="hidden" value="<%=mj1%>">			</td>
			<td><input name="jjfs1" type="hidden" value="<%=jjfs1%>"><%=jjfsmc1%></td>
			<td><input name="pmdj1" type="hidden" value="<%=pmdj1%>"><%=pmdj1%></td>
			<td><input name="ymdj1" type="hidden" value="<%=ymdj1%>"><%=ymdj1Str%></td>

			<td><input name="xcmbm2" type="hidden" value="<%=xcmbm2%>"><%=xcmbm2%></td>
			<td><input name="mbcl2" type="hidden" value="<%=mbcl2%>"><%=mbcl2%></td>
			<td><input name="xbpz2" type="hidden" value="<%=xbpz2%>"><%=xbpz2%></td>
			<td><input name="gd2" type="hidden" value="<%=gd2%>"><%=gd2Str%></td>
			<td><input name="kd2" type="hidden" value="<%=kd2%>"><%=kd2Str%>
			<input name="mj2" type="hidden" value="<%=mj2%>">			</td>
			<td><input name="jjfs2" type="hidden" value="<%=jjfs2%>"><%=jjfsmc2%></td>
			<td><input name="pmdj2" type="hidden" value="<%=pmdj2%>"><%=pmdj2Str%></td>
			<td><input name="ymdj2" type="hidden" value="<%=ymdj2%>"><%=ymdj2Str%></td>
			<td>
				<input name="zsxt" type="hidden" value="<%=zsxt%>">
				<input name="bjbz" type="hidden" value="<%=bjbz%>">
				<input name="bz" type="hidden" value="<%=bz%>"><%=bz%>
			</td>
		</tr>
		<%
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
      </table></td>
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
	FormName.action="SaveExcelCopyXcm.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
