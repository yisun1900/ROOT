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

String ssfgs=(String)session.getAttribute("ssfgs");
String lrbm=(String)session.getAttribute("dwbh");

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;
String[][] outStr=null; 
String bgcolor=null;

String ygmc=null;//Ա������

double jjbqntq =0;//ȥ��ͬ���¶����Ĳ�ֵ
double jjbbyjh=0;//���¼ƻ�
double jjbylj=0;//�����ۼ�
double jjbdmbylj=0;//�������汾���ۼƹ��̲�ֵ
double jjbszjh=0;//���ܼƻ�
double jjbszwc=0;//�������
double jjbbzyj=0;//����Ԥ��

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql = null;

String bmmc=null;//��������
String bmrs=null;//��������

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

  		
    //��ѯ������������
	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bmmc=rs.getString("dwmc");
	}
	rs.close();
	ps.close();
	
	//��ѯ��������
	ls_sql="SELECT count(*) rs";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and  dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		bmrs=rs.getString("rs");
	}
	rs.close();
	ps.close();

	
	
	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">

  
 <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">

  <tr>
    <td height="25" colspan="13" align="center">�ҾӲ���¼�������������<%=zqs%>��
	<input type="hidden" name="yy_jjb_lrr" value="<%=yhdlm%>">
	<input type="hidden" name="zqs" value="<%=zqs%>">		</td>
  </tr>
  <tr>
    <td  height="28" align="center">��������</td>
    <td colspan="3" align="center"><%=date_ss%>��<%=date_se%></td>
    <td align="center">��������</td>
    <td colspan="4"  align="center"><%=date_bs%>��<%=date_be%></td>
    </tr>
  <tr>
    <td height="28" align="center">��������</td>
    <td align="center"><%=bmmc%></td>
    <td colspan="2" align="center">��װ��������</td>
    <td align="center"><%=bmrs%></td>
    <td colspan="3" align="center">��λ����</td>
    </tr>
  
  <tr align="center">
    <td width="121" height="20" >����</td>
    <td width="106" >ȥ��ͬ���¶����Ĳ�ֵ</td>
    <td width="118" >���¼ƻ�</td>
    <td width="118" >�����ۼ�</td>
    <td width="118">�������汾���ۼƹ��̲�ֵ</td>
    <td width="118" >���ܼƻ�</td>
    <td width="118" >�������</td>
    <td width="124" >����Ԥ��</td>
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
		if (len!=8)
		{
			out.println("�����������°�Excelģ��");
			return;
		}


		ygmc=outStr[i][0].trim();//Ա������
		
		try{
			jjbqntq=Double.parseDouble( outStr[i][1].trim() );
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]ȥ��ͬ���¶����Ĳ�ֵ:"+outStr[i][1]+"��������:"+e);
			return;
		}
		try{
			jjbbyjh=Double.parseDouble( outStr[i][2].trim() );
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]���¼ƻ�:"+outStr[i][2]+"��������:"+e);
			return;
		}
		try{
			jjbylj=Double.parseDouble( outStr[i][3].trim() );//
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]�����ۼ�:"+outStr[i][3]+"��������:"+e);
			return;
		}
		try{
			jjbdmbylj=Double.parseDouble( outStr[i][4].trim() );//
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]�������汾���ۼƹ��̲�ֵ:"+outStr[i][4]+"��������:"+e);
			return;
		}
		try{
			jjbszjh=Double.parseDouble( outStr[i][5].trim() );//
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]���ܼƻ�:"+outStr[i][5]+"��������:"+e);
			return;
		}
		try{
			jjbszwc=Double.parseDouble(outStr[i][6].trim());//
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]�������:"+outStr[i][6]+"��������:"+e);
			return;
		}
		try{
			jjbbzyj=Double.parseDouble(outStr[i][7].trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]����Ԥ��:"+outStr[i][7]+"��������:"+e);
			return;
		}

		
		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=ygmc%> 
        <input name="ygmc" type="hidden" value="<%=ygmc%>">      </td>
      <td><%=jjbqntq%> 
        <input name="jjbqntq" type="hidden" value="<%=jjbqntq%>">      </td>
      <td> <%=jjbbyjh%>
        <input name="jjbbyjh" type="hidden" value="<%=jjbbyjh%>" >      </td>
      <td> <%=jjbylj%>
        <input name="jjbylj" type="hidden" value="<%=jjbylj%>" >      </td>
      <td><%=jjbdmbylj%> 
        <input name="jjbdmbylj" type="hidden" value="<%=jjbdmbylj%>">      </td>
	  <td > <%=jjbszjh%>
        <input name="jjbszjh" type="hidden" value="<%=jjbszjh%>" >      </td>

	  <td > <%=jjbszwc%>
        <input name="jjbszwc" type="hidden" value="<%=jjbszwc%>" >      </td>
      <td> <%=jjbbzyj%>
        <input name="jjbbzyj" type="hidden" value="<%=jjbbzyj%>" >      </td>
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
  	<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
	<input type="hidden" name="ssbm" value="<%=lrbm%>">
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