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
String fwdz=null;
String lxfs=null;
String yxtxdz=null;
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

double a=0;
double b=0;



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
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
	a=(sjhtje*0.2);
	b=(sjhtje-sjhtje*0.2);	
	

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
	}
	
	
	
  catch (Exception e) {
	//out.print("Exception: " + e);
    out.print("Exception: " + ls_sql);
	return;
 
   
	
	}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
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
    <td colspan="7"><span lang=EN-US></span></td>
    <!--  <td align="right">http://pesyddl.panasonic.cn/</td> -->
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="left"><strong>��ͬ���<u><%=hth%></u></strong></p></td>
   </tr> 
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="center"><strong>סլ����װ��װ��ʩ�� </strong></p></td>
   </tr> 
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="center"><strong>��ƺ�ͬ</strong></p></td>
   </tr> 
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
     <td height="35"  >�����ˣ�ȫ�ƣ���   <u><%=khxm%></u></td>
  </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�а��ˣ�ȫ�ƣ���   <u>�����ڴ�װ�ι��̣����������޹�˾</u> </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���ա��л����񹲺͹���ͬ������������ط��ɷ��棬�����˽�λ��<u><%=fwdz%></u>���ݵ�װ��װ�����ί�и��а��ˡ�˫����ѭƽ����Ը����ƽ���ŵ�ԭ�򣬾�������ˣ���Э��һ�´������Э�顣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��1��&nbsp;&nbsp;���̸ſ���</td>
   </tr>
  <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.1.��Ŀ���ƣ�<u><%=fwdz%></u></td>
  </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.2.���̵ص㣺<u><%=fwdz%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.3.�������: <u><%=fwmj%></u>ƽ����</td>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.4.�������ʦ��<u><%=sjs%></u>&nbsp;&nbsp;&nbsp;&nbsp;��ϵ�绰��<u><%=sjsdh%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��2��&nbsp;&nbsp;�շѱ�׼����ʹ�������ȡ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2.1.����װ������շѱ�׼Ϊ<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>Ԫ/M2��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2.2.��װ����շѱ�׼Ϊ<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>Ԫ/M2��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��3��&nbsp;&nbsp;��ͬ����ʽ</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.1.��ͬ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ��ܼ�����ң�<u><%=sjhtje%></u>Ԫ����д��<u><%=cf.NumToRMBStr(sjhtje)%></u>��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���У�����װ����Ʒѣ�����ң�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>Ԫ����װ��Ʒѣ�����ң�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>Ԫ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.2�����ʽ</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.2.1. ��ͬǩ�����շ����˽�����Ʒ��ܶ��20%��Ϊ��ƶ���<u><%=cf.formatDouble(a,"#########")%></u>Ԫ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.2.2.��ͬǩ���������ڽ�����Ʒ���<u><%=cf.formatDouble(b,"#########")%></u>Ԫ����������Լ����ǰ����Ʒ����ͬʱ���Ѹ������Զ�ת��Ϊ��Ʒ�֮���֡�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.3��ͼֽ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.3.1. �а������յ���Ʒ�ȫ�������<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�����������ʩ��ͼ��ơ�ͼֽ���ݰ���ƽ��ǽ��Ķ�ͼ��ƽ�沼��ͼ��Ч��ͼ�����沼��ͼ������ͼ����ؽڵ����ͼ���ƾ߿���ͼ��������λͼ��ˮ�㶨λͼ�ȣ�����ɹ���Ԥ�㡣</td>
   </tr>
  <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.3.2.�а������յ���Ʒ�ȫ���<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�������������װ������򷽰���</td>
  </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��4��&nbsp;&nbsp;�����ˡ��а���˫��Ȩ��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.������Ȩ��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.1. ���������ڱ���ͬǩ����    ���ڰ��а��˵�Ҫ����а����ṩ��������й����ϡ������������ڣ��ù���/����ԭ����ƽ��ͼ������ͼ��ˮ���硢�յ�����ͼ�ȡ�������Ӧ��ǰ�����ϵ�׼ȷ�ԡ������Ը����򷢰����ύ��ǰ�����ϴ������覴õ��³а��˳��ߵ����ͼֽ�����׼ȷ�ģ��а��˲��е��κ����Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.2.������Ӧ��Լ��ʱ����а��˹�ͬ���з������ۣ�������飬��Լ���޸���Ƶ����ޡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.3.������Ӧ����ͬ������Ʒѣ���Ʒ����ڲ��˻����á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.4.����������ϳа������к�ͬ�еĸ������ڹ���������������ʦ��������Ʒ�����ͨ��ϸ���˶��ȡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.5.��������ϼල�а������ʦ�ĽӴ����񡢽����������Ʊ���ȹ���������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.6.��������Ҫ��Ķ�ԭ�еĳ��ؽṹ����ص���ˮλ�õȣ���ȡ����ز��ţ�������ҵ�������ز������̡����ݽ�����Ƶ�λ��ʩ����λ�ȣ�������ͬ�⣬�����ге���ط��ü���Ķ�������һ�в���������а��˲��е��ɴ˷��������з��ü����Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.�а���Ȩ��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.1.�а���Ӧ���ݷ����˵������Ҫ���������ṩ��ʩ���й����ϡ��ֳ�������ʵ�ʳߴ���˫��Լ����ʱ���ڣ���ɸ����׶ε���ƹ��������ͼֽ��Ԥ�㣩����˫������������޸ģ��ﵽ���������⡣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.2.�а��˸���ʩ���е���ƽ��ף�������Ʊ��Ǣ�̣��μ����ա�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.3. ���ݹ��ҹ涨���а�����Ȩ����޸�ԭ�еĳ���ǽ��ṹ����ˮλ�õȣ��˲�����������跢��������ί�з��ز������̡����ݽ�����Ƶ�λ��ʩ����λ�ȸ�����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�ɣ����ɷ����˳е�������μ����ã��а��˲��е���˷������κη��á�</td>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.4.�а��˰�����ͬ�涨�򷢰����ṩ����������ļ��������������ڱ���ͬ��ȷ��ί�га�����ƵĹ�����Ŀ�У��Ǿ��а�������ͬ�⣬�����˲������Ը������ã�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��������������ʹ�ã����������ļ���Ӧ�÷�Χ���಻��ת�õ����������޷������ڱ�ί�������Ŀʹ�ã����Ա�֤�а��˵���ư�Ȩ�����򷢰���Ӧ֧���а����൱</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�ڱ���ͬ�����ܶ�30%��ΥԼ�𣬲��⳥�а�����˶�������һ����ʧ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.5.����������ļ��������󶨺��������������������а����������ʱ���а�����Ӧ˳���򷢰����ύ����ļ������ڣ��������ṩЧ��ͼ�������谴��׼��ơ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.6.�а������յ�������ȫ����ƷѺ󣬲����򷢰����ṩȫ������ı�����ͼֽ��Ԥ�㣩��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��5��&nbsp;&nbsp;ΥԼ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.1 ���������ڸ���ģ�ÿ����һ�գ���Ӧ��δ������ġ�0.02��%֧��ΥԼ�����ڴ10���գ��а�����Ȩ�����ͬ�������˻���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��6��&nbsp;&nbsp;����Լ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.1.���������Ͽ�����ļ���Ԥ��Ļ����ϣ�����а���ǩ�����̺�ͬ��˫��ǩ�����̺�ͬ�󣬱���ƺ�ͬ�Զ���ֹ�����������μ����̺�ͬ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.2.��ͬ���������������Ա���ͬ��Ϊ׼���κο�ͷЭ�鼰������Ϊ����Ϊ��Ч��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.3.����ͬ��˫��ǩ���ҼӸǳа��˹�˾��ͬר���º���Ч��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.4.��������δ������Ʒѣ��а��˲��ṩ����ļ���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��7��&nbsp;&nbsp;��ͬΥԼ����ֹ��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.1.�籾��ͬ���й��������ɿ�������ʹ��ͬ�޷��������У�����ͬ��ֹ��˫�������е�ΥԼ���Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.2.����ִͬ�й����У��緢�����飬˫��Ӧ����Э�̽������Э�̲��ɣ�˫��������а������ڵ�����Ժ���ߡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.3.����ͬһʽ���ݣ�˫����ִһ�ݣ�����ͬ�ȷ���Ч����</td>
   </tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >��&nbsp;&nbsp;��&nbsp;&nbsp;�ˣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	   <td width="50%"  height="40" >��&nbsp;&nbsp;��&nbsp;&nbsp;�ˣ������ڴ�װ�ι��̣����������޹�˾</td>
  </tr>
  <BR>  
     <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >��Ч֤���ţ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	   <td width="50%"  height="40" >���������ˣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >��Ȩί���ˣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
       <td width="50%"  height="40" >��&nbsp;&nbsp;��&nbsp;&nbsp;�� ��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >��Ч֤���ţ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
       <td width="50%"  height="40" >��&nbsp;&nbsp;��&nbsp;&nbsp;�ˣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
       <td width="50%"  height="40" >��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <BR>  
</table>

<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0"  bgcolor="#000000" style='FONT-SIZE: 30px'>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><strong>����װ������ı�ȷ�ϵ�</strong></td>
   </tr>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >�����ˣ�<%=khxm%></td>
  </tr>
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >�а��ˣ������ڴ�װ�ι��̣����������޹�˾</td>
  </tr>
   <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="35" >��Ŀ���ƣ�<%=fwdz%></td>
	   <td width="10%"  height="35" ><div align="center">���������</div></td>
       <td width="40%"  height="35" ><%=fwmj%>ƽ����</td>
  </tr>
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >���̵�ַ��<%=fwdz%></td>
  </tr>
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >��Ʒ��ܼۣ�(�����)<%=sjhtje%>Ԫ&nbsp;&nbsp;&nbsp;&nbsp;����д����<%=cf.NumToRMBStr(sjhtje)%></td>
  </tr> 
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >ȷ��ͼֽ���ݣ�������Ӧ��&nbsp;&nbsp;&nbsp;&nbsp;���򡰡̡� </td>
  </tr>  
</table>
<p>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px' rules=cols>
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >1.ԭʼƽ��ͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >����ͼֽ���ݼ���</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >2.ƽ�沼��ͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >3.���沼��ͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >��ע��</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >4.�������ͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >��������д��Ϊͼֽ�޵���</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >5.Ч��ͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >6.����װ�����Ԥ���飺��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >7.����װ�����������ϸ��Ԥ���飺��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >8.ƽ��ǽ��Ķ�ͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >9.������ʷֲ�ͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >10.�ƾ߿���ͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >11.������λͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >12.ˮ�㶨λͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >13.ů�����յ���λͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" ><table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>������ǩ�֣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</table></td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >14.�ڵ���ͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" ><table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>�������ʦǩ�֣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</table></td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >15.����ͼ����&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��</td>
	   <td width="31%"  height="35" >�������ǩ�֣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>  
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr bgcolor="#FFFFFF" >
	   <td width="9%"  height="35" ><div align="right">��ע��&nbsp;</div></td>
	   <td width="91%"  height="35" >&nbsp;&nbsp;&nbsp;1-7Ϊ�������ͼֽ���ݣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1-15Ϊʩ��ͼ���ͼֽ���ݣ�</td>
  </tr>  
</table> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px' rules=none> 
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >ʩ��ͼͼֽ���ݾ��Ѿ��������Ͽɣ�ͬ�⽻��&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="33%"  height="35" >������ǩ�֣�</td>
       <td width="33%"  height="35" >�������ʦǩ�֣�</td>
	   <td width="34%"  height="35" >�������ǩ�֣�</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="33%"  height="35" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
	   <td width="33%"  height="35" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
       <td width="34%"  height="35" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
  </tr>    
</table>
</body>
</html>