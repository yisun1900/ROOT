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

String fgsmc=null;
String fgsbh=null;

String yy_lrglf_ysblStr=null;
String yy_lrglf_sjsqStr=null;
String yy_lrsj_ysblStr=null;
String yy_lrsj_sjsqStr=null;
String yy_lrgc_qnpjStr=null;
String yy_lrgc_bzzsStr=null;
String yy_lrzc_qnpjStr=null;
String yy_lrzc_bzzsStr=null;

double yy_lrglf_ysbl=0;
double yy_lrglf_sjsq=0;
double yy_lrsj_ysbl=0;
double yy_lrsj_sjsq=0;

double yy_lrgc_qnpj=0;

double yy_lrgc_bzzs=0;
double yy_lrzc_qnpj=0;
double yy_lrzc_bzzs=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql = null;

int zqs=0;
String date_ss=null;//���ܿ�ʼʱ��
String date_se=null;//���ܽ���ʱ��
String date_bs=null;//���ܿ�ʼʱ��
String date_be=null;//���ܽ���ʱ��

int row=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	//��ѯ����
	ls_sql="SELECT zqs,yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" order by yy_rqsd_bzs desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zqs=rs.getInt("zqs");
		date_ss=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		date_se=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		date_bs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		date_be=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	}
	rs.close();
	ps.close();
	
	
	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">

  
<table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
 <tr >
<td height="26" colspan="13" align="center" >����ؼ�����ָ�꣨��������<%=zqs%>��</td>
</tr>
<tr>
    <td  height="28" align="center" width="147">��������</td>
    <td colspan="4" align="center"><%=date_ss%>��<%=date_se%></td>
    <td align="center" >��������</td>
    <td colspan="4"  align="center" ><%=date_bs%>��<%=date_be%></td>
    </tr>
<tr>
</table> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%" rowspan="2">�ֹ�˾</td>
  <td colspan="2">�ͻ�����ѱ���</td>
  <td colspan="2">˰����������</td>
  <td colspan="2">����ë����</td>
  <td colspan="2">����ë����</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">Ӧ�ձ���(%)</td>
	<td  width="7%">ʵ����ȡ(%)</td>
	<td  width="7%">Ӧ�ձ���(%)</td>
	<td  width="7%">ʵ����ȡ(%)</td>
	<td  width="7%">ȥ��ƽ��(%)</td>
	<td  width="7%">����ָ��(%)</td>
	<td  width="7%">ȥ��ƽ��(%)</td>
	<td  width="7%">����ָ��(%)</td>
  </tr>

<%
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

	
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] xmbhStr=new String[outStr.length-1];

	for (int i=2;i<outStr.length ;i++ )
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
		if (len<9)
		{
			out.println("�����������°�Excelģ��");
			return;
		}


		fgsmc=outStr[i][0].trim();
		yy_lrglf_ysblStr=outStr[i][1].trim();
		yy_lrglf_sjsqStr=outStr[i][2].trim();
		yy_lrsj_ysblStr=outStr[i][3].trim();
		yy_lrsj_sjsqStr=outStr[i][4].trim();
		yy_lrgc_qnpjStr=outStr[i][5].trim();

		yy_lrgc_bzzsStr=outStr[i][6].trim();
		yy_lrzc_qnpjStr=outStr[i][7].trim();
		yy_lrzc_bzzsStr=outStr[i][8].trim();


		fgsbh="";
		ls_sql="select dwbh";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwmc='"+fgsmc+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=cf.fillNull(rs.getString("dwbh"));
		}
		rs.close();
		ps.close();

		if (fgsbh==null || fgsbh.equals(""))
		{
			out.println("<BR>���󣡷ֹ�˾�����ڣ�"+fgsmc);
			return;
		}

		try{
			yy_lrglf_ysbl=Double.parseDouble(yy_lrglf_ysblStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[�ͻ�����ѱ���Ӧ�ձ���(%)]��������:"+e);
			return;
		}

		try{
			yy_lrglf_sjsq=Double.parseDouble(yy_lrglf_sjsqStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[�ͻ�����ѱ���ʵ����ȡ(%)]��������:"+e);
			return;
		}

		try{
			yy_lrsj_ysbl=Double.parseDouble(yy_lrsj_ysblStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[˰����������Ӧ�ձ���(%)]��������:"+e);
			return;
		}

		try{
			yy_lrsj_sjsq=Double.parseDouble(yy_lrsj_sjsqStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[˰����������ʵ����ȡ(%)]��������:"+e);
			return;
		}

		try{
			yy_lrgc_qnpj=Double.parseDouble(yy_lrgc_qnpjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[����ë����ȥ��ƽ��(%)]��������:"+e);
			return;
		}

		try{
			yy_lrgc_bzzs=Double.parseDouble(yy_lrgc_bzzsStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[����ë���ʱ���ָ��(%)]��������:"+e);
			return;
		}

		try{
			yy_lrzc_qnpj=Double.parseDouble(yy_lrzc_qnpjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[����ë����ȥ��ƽ��(%)]��������:"+e);
			return;
		}

		try{
			yy_lrzc_bzzs=Double.parseDouble(yy_lrzc_bzzsStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[����ë���ʱ���ָ��(%)]��������:"+e);
			return;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=fgsmc%> 
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">      </td>
      <td><%=yy_lrglf_ysbl%> 
        <input name="yy_lrglf_ysbl" type="hidden" value="<%=yy_lrglf_ysbl%>">      </td>
      <td> <%=yy_lrglf_sjsq%>
        <input name="yy_lrglf_sjsq" type="hidden" value="<%=yy_lrglf_sjsq%>" >      </td>
      <td> <%=yy_lrsj_ysbl%>
        <input name="yy_lrsj_ysbl" type="hidden" value="<%=yy_lrsj_ysbl%>" >      </td>
      <td><%=yy_lrsj_sjsq%> 
        <input name="yy_lrsj_sjsq" type="hidden" value="<%=yy_lrsj_sjsq%>">      </td>
	  <td align="center"> <%=yy_lrgc_qnpj%>
        <input name="yy_lrgc_qnpj" type="hidden" value="<%=yy_lrgc_qnpj%>" >      </td>

	  <td align="center"> <%=yy_lrgc_bzzs%>
        <input name="yy_lrgc_bzzs" type="hidden" value="<%=yy_lrgc_bzzs%>" >      </td>
      <td> <%=yy_lrzc_qnpj%>
        <input name="yy_lrzc_qnpj" type="hidden" value="<%=yy_lrzc_qnpj%>" >      </td>
      <td> <%=yy_lrzc_bzzs%>
        <input name="yy_lrzc_bzzs" type="hidden" value="<%=yy_lrzc_bzzs%>" >      </td>
    </tr>
    <%
	}


}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
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
	<input type="hidden" name="zqs" value="<%=zqs%>">
      <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����">
    ��������Ŀ����<%=row%>    </tr>
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
