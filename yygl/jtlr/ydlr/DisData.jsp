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

String yy_sjzky_mbkhStr=null;
String yy_sjzky_sqdjStr=null;
String yy_sjsjb_sjfStr=null;
String yy_sjsjb_tqsjfStr=null;
String yy_sjsjb_gcczStr=null;
String yy_sjsjb_tqgcczStr=null;
String yy_sjjjb_byjhStr=null;
String yy_sjjjb_qntqStr=null;
String yy_sjscb_mbkhStr=null;
String yy_sjwxb_mbkhStr=null;
String yy_sjqtqd_mbkhStr=null;
String yy_sjscb_sqdjStr=null;
String yy_sjwxb_sqdjStr=null;
String yy_sjqtqd_sqdjStr=null;

int yy_sjzky_mbkh=0;
int yy_sjzky_sqdj=0;
double yy_sjsjb_sjf=0;
double yy_sjsjb_tqsjf=0;
double yy_sjsjb_gccz=0;
double yy_sjsjb_tqgccz=0;
double yy_sjjjb_byjh=0;
double yy_sjjjb_qntq=0;
int yy_sjscb_mbkh=0;
int yy_sjwxb_mbkh=0;
int yy_sjqtqd_mbkh=0;
int yy_sjscb_sqdj=0;
int yy_sjwxb_sqdj=0;
int yy_sjqtqd_sqdj=0;

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
<td height="26" colspan="13" align="center" >�����¶�ָ���ͬ�����ݣ���������<%=zqs%>��</td>
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
  <td  width="7%" rowspan="2">�ֹ�˾</td>
  <td colspan="2">�ܿ�Դ</td>
  <td colspan="2">�г���</td>
  <td colspan="2">������</td>
  <td colspan="4">��Ʋ�</td>
  <td colspan="2">�ҾӲ�</td>
  <td colspan="2">��������</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">Ŀ��ͻ��������¼ƻ�</td>
	<td  width="5%">��ȡ�����������¼ƻ�</td>

	<td  width="5%">Ŀ��ͻ��������¼ƻ�</td>
	<td  width="5%">��ȡ�����������¼ƻ�</td>
	<td  width="5%">Ŀ��ͻ��������¼ƻ�</td>
	<td  width="5%">��ȡ�����������¼ƻ�</td>

	<td  width="5%">��Ʒѱ��¼ƻ�</td>
	<td  width="5%">ȥ��ͬ���¶���Ʒ�</td>
	<td  width="5%">���̲�ֵ���¼ƻ�</td>
	<td  width="5%">ȥ��ͬ���¶ȹ��̲�ֵ</td>
	<td  width="6%">���Ĳ�ֵ���¼ƻ�</td>
	<td  width="6%">ȥ��ͬ���¶����Ĳ�ֵ</td>

	<td  width="6%">Ŀ��ͻ��������¼ƻ�</td>
	<td  width="6%">��ȡ�����������¼ƻ�</td>
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
		if (len<15)
		{
			out.println("�����������°�Excelģ��");
			return;
		}


		fgsmc=outStr[i][0].trim();


		yy_sjzky_mbkhStr=outStr[i][1].trim();
		yy_sjzky_sqdjStr=outStr[i][2].trim();

		yy_sjscb_mbkhStr=outStr[i][3].trim();
		yy_sjscb_sqdjStr=outStr[i][4].trim();
		yy_sjwxb_mbkhStr=outStr[i][5].trim();
		yy_sjwxb_sqdjStr=outStr[i][6].trim();

		yy_sjsjb_sjfStr=outStr[i][7].trim();
		yy_sjsjb_tqsjfStr=outStr[i][8].trim();
		yy_sjsjb_gcczStr=outStr[i][9].trim();

		yy_sjsjb_tqgcczStr=outStr[i][10].trim();
		yy_sjjjb_byjhStr=outStr[i][11].trim();
		yy_sjjjb_qntqStr=outStr[i][12].trim();

		yy_sjqtqd_mbkhStr=outStr[i][13].trim();

		yy_sjqtqd_sqdjStr=outStr[i][14].trim();


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
			yy_sjzky_mbkh=Integer.parseInt(yy_sjzky_mbkhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[�ܿ�ԴĿ��ͻ��������¼ƻ�]��������:"+e);
			return;
		}

 		try{
			yy_sjzky_sqdj=Integer.parseInt(yy_sjzky_sqdjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[�ܿ�Դ��ȡ�����������¼ƻ�]��������:"+e);
			return;
		}

		try{
			yy_sjsjb_sjf=Double.parseDouble(yy_sjsjb_sjfStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[��Ʋ���Ʒѱ��¼ƻ�]��������:"+e);
			return;
		}

		try{
			yy_sjsjb_tqsjf=Double.parseDouble(yy_sjsjb_tqsjfStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[��Ʋ�ȥ��ͬ���¶���Ʒ�]��������:"+e);
			return;
		}

		try{
			yy_sjsjb_gccz=Double.parseDouble(yy_sjsjb_gcczStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[��Ʋ����̲�ֵ���¼ƻ�]��������:"+e);
			return;
		}

		try{
			yy_sjsjb_tqgccz=Double.parseDouble(yy_sjsjb_tqgcczStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[��Ʋ�ȥ��ͬ���¶ȹ��̲�ֵ]��������:"+e);
			return;
		}

		try{
			yy_sjjjb_byjh=Double.parseDouble(yy_sjjjb_byjhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[�ҾӲ����Ĳ�ֵ���¼ƻ�]��������:"+e);
			return;
		}

		try{
			yy_sjjjb_qntq=Double.parseDouble(yy_sjjjb_qntqStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[�ҾӲ�ȥ��ͬ���¶����Ĳ�ֵ]��������:"+e);
			return;
		}

		try{
			yy_sjscb_mbkh=Integer.parseInt(yy_sjscb_mbkhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[�г���Ŀ��ͻ��������¼ƻ�]��������:"+e);
			return;
		}

		try{
			yy_sjwxb_mbkh=Integer.parseInt(yy_sjwxb_mbkhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[������Ŀ��ͻ��������¼ƻ�]��������:"+e);
			return;
		}

		try{
			yy_sjqtqd_mbkh=Integer.parseInt(yy_sjqtqd_mbkhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[��������Ŀ��ͻ��������¼ƻ�]��������:"+e);
			return;
		}

		try{
			yy_sjscb_sqdj=Integer.parseInt(yy_sjscb_sqdjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[�г�����ȡ�����������¼ƻ�]��������:"+e);
			return;
		}

		try{
			yy_sjwxb_sqdj=Integer.parseInt(yy_sjwxb_sqdjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[��������ȡ�����������¼ƻ�]��������:"+e);
			return;
		}

		try{
			yy_sjqtqd_sqdj=Integer.parseInt(yy_sjqtqd_sqdjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[����������ȡ�����������¼ƻ�]��������:"+e);
			return;
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=fgsmc%> 
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">      </td>
      <td><%=yy_sjzky_mbkh%> 
        <input name="yy_sjzky_mbkh" type="hidden" value="<%=yy_sjzky_mbkh%>">      </td>
      <td> <%=yy_sjzky_sqdj%>
        <input name="yy_sjzky_sqdj" type="hidden" value="<%=yy_sjzky_sqdj%>" >      </td>

	  <td align="center"> <%=yy_sjscb_mbkh%>
        <input name="yy_sjscb_mbkh" type="hidden" value="<%=yy_sjscb_mbkh%>" >      </td>
      <td> <%=yy_sjscb_sqdj%>
        <input name="yy_sjscb_sqdj" type="hidden" value="<%=yy_sjscb_sqdj%>" >      </td>

      <td> <%=yy_sjwxb_mbkh%>
        <input name="yy_sjwxb_mbkh" type="hidden" value="<%=yy_sjwxb_mbkh%>" >      </td>
	  <td align="center"> <%=yy_sjwxb_sqdj%>
        <input name="yy_sjwxb_sqdj" type="hidden" value="<%=yy_sjwxb_sqdj%>" >      </td>

      <td> <%=yy_sjsjb_sjf%>
        <input name="yy_sjsjb_sjf" type="hidden" value="<%=yy_sjsjb_sjf%>" >      </td>
      <td><%=yy_sjsjb_tqsjf%> 
        <input name="yy_sjsjb_tqsjf" type="hidden" value="<%=yy_sjsjb_tqsjf%>">      </td>
	  <td align="center"> <%=yy_sjsjb_gccz%>
        <input name="yy_sjsjb_gccz" type="hidden" value="<%=yy_sjsjb_gccz%>" >      </td>

	  <td align="center"> <%=yy_sjsjb_tqgccz%>
        <input name="yy_sjsjb_tqgccz" type="hidden" value="<%=yy_sjsjb_tqgccz%>" >      </td>
      <td> <%=yy_sjjjb_byjh%>
        <input name="yy_sjjjb_byjh" type="hidden" value="<%=yy_sjjjb_byjh%>" >      </td>
      <td> <%=yy_sjjjb_qntq%>
        <input name="yy_sjjjb_qntq" type="hidden" value="<%=yy_sjjjb_qntq%>" >      </td>

      <td> <%=yy_sjqtqd_mbkh%>
        <input name="yy_sjqtqd_mbkh" type="hidden" value="<%=yy_sjqtqd_mbkh%>" >      </td>

      <td> <%=yy_sjqtqd_sqdj%>
        <input name="yy_sjqtqd_sqdj" type="hidden" value="<%=yy_sjqtqd_sqdj%>" >      </td>
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
