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
//String yhdlm=(String)session.getAttribute("yhdlm");
//String yhmc=(String)session.getAttribute("yhmc");




String khxm=null;
String xb=null;
String  fwdz=null;
String  lxfs=null;
String  yxtxdz=null;
String sjs=null;
String hth=null;
String hyh=null;
String fwmj=null;
String zjxm=null;
String hxbm=null;

double qye=0;
double sjhtje=0;
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
    /*ls_sql="select zjxm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();
	*/
		
    ls_sql=" select sjhtje,dj from  crm_sjhtxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{    	
	
         sjhtje=rs.getDouble("sjhtje");
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
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
       <tr bgcolor="#FFFFFF"> 
   
    <td align="center" colspan="4" height="35"><strong><u>��סլ����װ�����ί�к�ͬ�������׼����</u></strong>   </td>
 
   </tr> 
   <tr bgcolor="#FFFFFF"> 
   
    <td align="center" colspan="4" height="35"><strong>��ͬ��ţ�<u><%=hth%></u></strong>   </td>
  
   </tr> 
    <tr bgcolor="#FFFFFF"> 
	<td width="23%" height="35"><strong>1����ͬ˫��</strong></td>
    <td width="36%">&nbsp;</td>
    <td width="20%">&nbsp;</td>
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
    <td></td>
    <td></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">Ӫҵִ�պţ�</td>
    <td ><u>110105005815247</u></td>
    <td colspan="2">�������ʵȼ�֤��ţ�
  <u>B30340110108162 </u></td>
  </tr>
   <tr bgcolor="#FFFFFF">
    <td height="30">�칫�ص㣺</td>
    <td colspan="2"><u>����������������·104���ڴ�������B�������ڴ� </u></td>
    
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">��������ˣ�<u><%=sjs%></u></td>
    <td>��ϵ�绰��<u><%=sjsdh%></u></td>
    <td>���ʦ����</td>
    <td><u><%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb",sjsjb,true);
%></u></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td height="35"><p><strong>2.��Ŀ�ſ� </strong></p></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">2.1 �����Ŀ��ַ��</td>
    <td colspan="3"><u><%=fwdz%></u></td>
    
  </tr>
  <tr  bgcolor="#FFFFFF">
  <td height="30">����:<u>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%></u></td>
    <td>��;��<u><%
	cf.selectItem(out,"select fwytbm,fwytmc from dm_fwytbm order by fwytbm",fwytbm,true);
%></u></td>
    <td colspan="2">���ڽ��������<u><%=fwmj%></u>ƽ����</td>
  
  </tr>
  <tr bgcolor="#FFFFFF">
  <td>��Ա���ţ�</td>
  <td><%=hyh%></td>
  <td></td>
  <td></td>
  </tr>

  <tr  bgcolor="#FFFFFF">
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"><strong>3������շѼ�֧����ʽ </strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="30" colspan="4" >3.1.5 �׷�ί���ҷ�������ƣ�������շѱ�׼�����ڽ���������㣬����Ϊÿƽ����
     ��<u><%=dj%></u>Ԫ���ҷ���ȡ��Ʒѹ��ƣ�<u><%=sjhtje%></u>Ԫ��</td>
  </tr>
 
   <tr  bgcolor="#FFFFFF">
     <td height="30" colspan="4" >&nbsp;</td>
  </tr> <tr  bgcolor="#FFFFFF">
     <td height="30" colspan="4"  >����д:<%=cf.NumToRMBStr(sjhtje)%>��</td>
  </tr>
     <tr bgcolor="#FFFFFF" >
           <td height="300">&nbsp;</td>
           <td></td>
           <td></td>
           <td>&nbsp;</td>
  </tr>
   <tr bgcolor="#FFFFFF" >
           <td height="100">&nbsp;</td>
           <td>�׷�ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
           <td colspan="2">�ҷ�ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
          
  </tr>
		  <tr bgcolor="#FFFFFF" >
           <td colspan="4"><b> ��ע�����泯�ϣ�װ���ڡ�סլ����װ�����ί�к�ͬ�����һҳ</b></td>
         </tr>
</table>

</body>
</html>
