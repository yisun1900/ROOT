<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");


String khxm=null;
String xb=null;
String  fwdz=null;
String  lxfs=null;
String  yxtxdz=null;
String sjs=null;
String hth=null;
String fwmj=null;
String zjxm=null;
String hxbm=null;
String hyh=null;

double qye=0;
double tchtje=0;
double dj=0;
String sjsdh="";
String zjdh="";
String ssfgs=null;
String dwbh=null;
String fwytbm=null;
String sjsjb=null;
	
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,lxfs,fwmj,hxbm,hth,fwytbm,hyh";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	    sjs=cf.fillNull(rs.getString("sjs"));
		//ssfgs=rs.getString("ssfgs");  
	  
		fwmj=cf.fillNull(rs.getString("fwmj"));
		
		hxbm=cf.fillNull(rs.getString("hxbm"));
	
		hth=cf.fillNull(rs.getString("hth"));
		fwytbm=cf.fillNull(rs.getString("fwytbm"));
		hyh=cf.fillNull(rs.getString("hyh"));
	}
	 rs.close();
	 ps.close();
		
    ls_sql=" select tchtje,dj from  crm_tchtxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{    	
	
         tchtje=rs.getDouble("tchtje");
	    dj=rs.getDouble("dj");
	}
	rs.close();
	ps.close();
	
	

	
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+sjs+"' and zwbm='04'";
	//ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+crm_khxx_sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	ls_sql=" select	sjsjb from sq_yhxx";
	ls_sql+=" where yhmc ='"+sjs+"' and zwbm='04'";
	//ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+crm_khxx_sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
	  sjsjb=cf.fillNull(rs.getString("sjsjb"));
	}
	rs.close();
	ps.close();
	
	
//�ʼ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where  ssfgs='"+ssfgs+"' and   yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	
	}	
  catch (Exception e) {
	//out.print("Exception: " + e);
    out.print("Exception: " + ls_sql);
	return;
 
   


	//���ʦ�绰

	/*	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+sjs+"' and zwbm='04'";
	//ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+crm_khxx_sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//�����绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//�ʼ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	//ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ls_sql+=" where  ssfgs='"+ssfgs+"' and   yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();*/
	
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
<body>
<table border="0" width="100%" cellspacing="0" cellpadding="1"   style='FONT-SIZE: 14px'>
       <tr bgcolor="#FFFFFF"> 
     <td align="left" colspan="4" height="35"><div align="center"><strong>����ͥ����װ��װ�޹���ʩ����ͬ���ײ��������׼�ļ�</strong></div></td>
   </tr> 
   <tr bgcolor="#FFFFFF"> 
   
    <td align="left" colspan="3" height="35"><strong>��ͬ��ţ�<u><%=hth%></u></strong>   </td>
   <td width="21%" align="center"></td>
   </tr> 
    <tr bgcolor="#FFFFFF"> 
	<td width="23%" height="35"><strong>1����ͬ˫��</strong></td>
    <td width="34%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">ί�з����׷�����</td>
    <td><u><%=khxm%></u></td>
    <td>��ϵ�绰��</td>
    <td><u><%=lxfs%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">�׷������ˣ�</td>
    <td><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
    <td>��ϵ�绰��</td>
    <td><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">��ַ:</td>
    <td colspan="3"><u><%=fwdz%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">�нӷ����ҷ�����</td>
    <td><u>�����ڴ�װ�ι��̣����������޹�˾ </u></td>
    <td>�������ʵȼ�֤��ţ� <u>B30340110108162 </u></td>
    <td></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">Ӫҵִ�պţ�</td>
    <td ><u>110105005815247</u></td>
    <td colspan="2">&nbsp;</td>
  </tr>
   <tr bgcolor="#FFFFFF">
    <td height="30">�칫�ص㣺</td>
    <td colspan="2"><u>����������������·104���ڴ�������B�������ڴ������ </u></td>
    
    <td>&nbsp;</td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td height="35"><p><strong>2.������� </strong></p></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">2.1 ���̵ص㣺</td>
    <td colspan="3"><u><%=fwdz%></u></td>
  </tr>
  <tr  bgcolor="#FFFFFF">
  <td height="30">���̻���:</td>
    <td><u>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%>
    </u></td>
    <td>�������ڽ��������</td>
    <td><u><%=fwmj%></u>ƽ����</td>
  </tr>

  <tr  bgcolor="#FFFFFF">
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35">�ײ��������</td>
    <td><u><%=tchtje%></u></td>
    <td>��д��</td>
    <td><%=cf.NumToRMBStr(tchtje)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td height="35">��Ա���ţ�</td>
  <td><%=hyh%></td>
  <td></td>
  <td></td>
  </tr>
     <tr bgcolor="#FFFFFF" >
       <td height="34"><strong>3.��ͬ���� </strong></td>
       <td></td>
       <td></td>
       <td>&nbsp;</td>
     </tr>
     <tr bgcolor="#FFFFFF" >
       <td height="53" colspan="4"><p align="left">������˫���Ѻ�Э�̣����ҷ��нӼ׷�����װ��װ�޹���ʩ���������Э�飺 <br>
         3.1&nbsp;&nbsp;�׷�ѡ���ҷ��ṩ�������ڴ�װ����Ŀ�� <br>
         3.2&nbsp;&nbsp;˫��ǩ����������󣬼׷�����2000Ԫ����д����ǪԪ�������� <br>
         3.3&nbsp;&nbsp;�ҷ����յ�����󣬰������ʦ���Ų���������ͬ�׷�������ѡ�����ײͷ��ѡ����Ʒ������ʩ��ͼ�� <br>
         3.4&nbsp;&nbsp;˫�����һ�������ǩ��ʩ����ͬ��ǩ��ʩ����ͬ�󣬶���תΪ�����׸�� <br>
         3.5&nbsp;&nbsp;�׷����ҷ��������ʦ���Ų���ǰ����ʱҪ���˻��˶��𡣰������˻�����ʱ���׷���ָ�������ԭ���ͽ���ƾ֤�������ҷ��Ѱ��Ų������˻�����1000Ԫ��<br>3.6&nbsp;&nbsp;��������һʽ3�ݣ��׷���1�ݣ��ҷ���2��</p>           </td>
  </tr>
  <tr>
    <td colspan="4" height="70"></td>
  </tr>

   <tr bgcolor="#FFFFFF" >
           <td colspan="2" height="100" align="center">�׷�ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
           <td colspan="2" align="center">�ҷ�ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
		  <tr bgcolor="#FFFFFF" >
           <td colspan="4"><strong>��ע�����������ڿͻ�ȷ��ѡ���ײͷ���ʱǩ��һʽ���ݣ��ͻ�һ�ݣ�������ʩ����ͬһ��ת����</strong></td>
         </tr>
</table>

</body>
</html>
