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
String fwdz=null;
String hth=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String fbjgrq=null;
String sgd=null;
String sgdmc="";
String sgddh="";
double sgcbj=0;
double rgf=0;
double flf=0;


String zjdh="";
String ssfgs=null;
String dwbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,fwdz,hth,kgrq,jgrq-10 as fbjgrq,sgd,fgsbh,dwbh";
	ls_sql+=" FROM crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=rs.getString("hth");
		
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		fbjgrq=cf.fillNull(rs.getDate("fbjgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
	}
	 rs.close();
	 ps.close();

	
	ls_sql="SELECT dh";
	ls_sql+=" FROM sq_sgd";
    ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgddh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	ls_sql=" select zjxm from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxm=cf.fillNull(rs.getString("zjxm"));
	
	}
	rs.close();
	ps.close();
	
	
	
//���̵����绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where  yhmc ='"+zjxm+"' and  zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	

	ls_sql=" select sgcbj ";
	ls_sql+=" from crm_khqye";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
	}
	rs.close();
	ps.close();
	
	rgf=cf.round(sgcbj*0.5,0);
	flf=cf.round(sgcbj-rgf,0);	

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
    <td align="center" colspan="4" height="35"><strong>�ְ���ͬ��ɢװ��</strong>   </td>
   </tr> 
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><b>�׷�:</b>   <u>�������ĕr��װ�����޹�˾</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><b>��ϵ�绰��</b><u>0411-84547066</u> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>���棺</b><u>0411-84547575</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><b>�ҷ���</b><u><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><b>��ϵ�绰��</b><u><%=sgddh%></u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>���棺</b><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���ա��л����񹲺͹���ͬ���������л����񹲺͹��Ͷ���ͬ���������л����񹲺͹����������������йط��ɡ��������棬��ѭƽ�ȡ���Ը����ƽ�ͳ�ʵ���õ�ԭ�򣬽�ϱ�����̾�����������ס���˫��Э��һ�£�ǩ������ͬ���ϸ��������С�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1�����̸ſ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.1&nbsp;�������ƣ�<u><%=fwdz%>(<%=khxm%>)</u>�����̺�ͬ���:<u><%=hth%></u>��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.2&nbsp;���̵ص㣺<u><%=fwdz%>(<%=khxm%>)</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.3&nbsp;�������ڣ�<u><%=kgrq%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ڣ�<u><%=fbjgrq%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.4&nbsp;������׼���ﵽ����װ��װ�޹��̺ϸ��׼�������������ȷ��������׼�� </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>2��ʩ������</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;ʩ����Χ��<u><%=fwdz%></u>����λ�����Ż��ͣ�����ʩ��ͼֽ��Χ�ڵ�ȫ�����ݣ����׷�ָ���ĵ�����ίʩ��������й������⣩���Լ�����ʩ�������ϵ��ˡ���ʱ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >ʩ�Լ�ȫ����Ʒ�������������ȣ�ʩ�������Ա���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>3����ͬ����</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.1&nbsp;����ͬ�ݶ��ܼ�Ϊ<u><%=cf.formatDouble(sgcbj,"#########")%></u>Ԫ�������˹��ѹ̶�Ϊ<u><%=cf.formatDouble(rgf,"#########")%></u>Ԫ�����ķ��ݶ�Ϊ<u><%=cf.formatDouble(flf,"#########")%></u>Ԫ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.2&nbsp;�˹��Ѻ����׼���˹������Ѱ����ҷ��а���Χ�ڵ����й������ݡ�����ʩ���ڼ䣬���м۸񲻿ɵ������������䡣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���ķѺ����׼�������깤��ˮ�粿�֡�ǩ֤�������֡���˾ר�����Ŀۼ����ָ��ݼ׷���۲������̲��˶������������ۣ���ʵ����;</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;������Ŀ������ʩ��ǰ˫����ͬȷ�ϣ�ר�����Ĳ��֣�ˮ��ܡ���׽�����ˮ���ϵȣ�����Ӽ׷����á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.3&nbsp;֧����ʽ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;Ԥ������պ�ͬ�ܼ۵�<u>18��</u>֧���˹�Ԥ���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���ȿ�����������е�<u>80��</u>ʱ��֧��ʣ���˹��ѣ�����ͬ�ݶ��ܼ۵�<u>32%</u>����ͬʱ�۳��˹����ܶ��<u>2.3%</u>��Ϊ�����ѣ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�������̽����󣬾��׷���֯���պϸ񡢲�������ɿ�������ƾ���̾�����<u>15��</u>�������ڣ��׷�֧������ͬ������<u>100%</u>��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.4&nbsp;��ƱԼ�� </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�ҷ�����ȡ���Ŀ�ǰ������׷�������ҵ����һ�µĵȶ�Ϸ����Ϸ�Ʊ������׷���Ȩ�ܸ����ɴ˲��������μ���ʧ���ҷ��е���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>4������</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���̱������Թ��̿������պϸ�֮������㣬����װ��װ�޹��̱�������Ϊ���꣬�����ˮ���̡��з�ˮҪ��ĳ��������������ǽ��ķ���©Ϊ���ꡣ�����ڼ䷢�����������ҷ�ʩ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >����ԭ������ķ��ã�����ʩ����֤���п۳�����ʩ����֤�𲻹��۳�������ҷ������ְ����̿��п۳������ҷ�ʩ����֤�𼰷ְ����̿���۳����׷��м���׷����Ȩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>5��פ���ش�����ְ��</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.1&nbsp;�׷�פ���ش���������<u><%=zjxm%>��<%=zjdh%>��</u>��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.2&nbsp;�׷�פ���ش���ְ�𣺰���ͬԼ�����ܹ�˾����ί�У���ʱ�ṩ���ҷ�����ָ���׼��ͼֽ������������ͬԼ��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.3&nbsp;�ҷ�פ���ش���������<u><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>��<%=sgddh%>��</u>��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.4&nbsp;�ҷ�פ���ش���ְ�𣺰��׷�ȷ����ʩ�����ȼƻ����׷����Ƶ�ʩ��������ʩ���������ס�����Ŀ��ͼ׷��������ݺ�ͬ������ָ�Ҫ�����֯ʩ��������˫����ͬ�й涨������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >Ȩ�����������ؼ׷���Ŀ���ĸ�������涨��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>6���׷�Ȩ������</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.1&nbsp;�׷�Ϊ�ҷ��ṩ��ص�ʩ��ͼֽ��ʩ��������ʩ��������ʩ��ʩ�����ȼƻ���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�ҷ������󣬼׷�������ҷ�������ϸ��ʩ����������������ȫ������ʩ�����ס�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.2&nbsp;�׷�����ʩ���ڼ���ҷ���ʩ�����ȡ���������ȫ������ʩ���ȷ�����мල����顢���ա�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.3&nbsp;�׷�������ͬ���йع涨���ҷ������ķ�������������ʹ��ҷ�ʱ����Ч���׷���Ȩ���������ҷ��Ĺ��̿���ֱ�ӿ۳�����������֪ͨ�ҷ���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>7���ҷ�Ȩ������</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.1&nbsp;�ҷ�����߱�һ����רҵ������������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.2&nbsp;�ҷ�������ܼ׷���Ŀ�������̵�����Ա���׷����������Ա��ҵ���ļල������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.3&nbsp;�ҷ�������Ӽ׷���Ŀ��������Ա��Э��ָ�ӣ��ϸ������ͼֽ��ʩ�����չ淶���йؼ���Ҫ��ʩ����֯��ƾ�����֯ʩ����ȷ�����������ﵽԼ���ı�׼����ѧ������ҵ�ƻ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >��Ͷ���㹻����������������֤���ڣ���ǿ��ȫ����������ִ�а�ȫ�����淶���ϸ����ذ�ȫ�ƶȣ���ʵ��ȫ��ʩ��ȷ��ʩ����ȫ����ǿ�ֳ��������ϸ�ִ�н������ܲ��ż�����������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >���������йز��Ŷ�ʩ���ֳ��Ĺ����涨����������ʩ�����е���������������ɵ������޸ġ��������������ӡ���ȫ�¹ʡ��ֳ�������ɵ���ʧ�����ַ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.4&nbsp;�ҷ���ʩ���ֳ��������ؼ׷���Ŀ���ƶ��ĸ��ֹ����ƶȣ������ռ׷���Ŀ�����ֳ�����Ҫ�������ֳ����ϡ����ߵĺ����ѷŵȣ��Ͻ��˷Ѳ��ϣ�ͬʱ�ҷ�Ҫ����ʩ���ֳ����깤��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >���ֵĳ�Ʒ�������������ҷ���������������λ���η������𻵣��ҷ����ге��ɴ������һ�о�����ʧ�����ַ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.5&nbsp;�ҷ��ڹ���ʩ��ǰ�������ù������壬���׷���Ŀ�������̵�����Ա���մﵽ������׼�󣬷��ɰ���������������׼���д����ʩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.6&nbsp;�ҷ������ʩ���ֳ��׷����ṩ����ʱ��ʩ����������ʩ����λ��Ʒ�ı����������е������ҷ�����ԭ������𻵵ķ��ޡ��⳥���Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.7&nbsp;�ҷ����ý������������ת����ְ������з������׷���Ȩ�����ͬ���Ҷ����깤���̲�����㣬��֧���κο��ͬʱ�ҷ�Ҫ�е���صķ������Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.8&nbsp;�����ҷ���ԭ����ʹ�׷��⵽ҵ������ع�����λ����ģ�ȫ���������ҷ��е���������������ʩ�����ȡ�������������ȫ����������ʩ���ȷ��棬�׷���Ȩ���ҷ��Ĺ��̿�������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�۳���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.9&nbsp;�ҷ����ö�ԭ������ƽ��б�������ҷ����Ա����Ʒ����ķ��ú��ɴ˵��¼׷��ĸ�����ʧ�������ҷ��е�������Ĺ��ڲ���˳�ӡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.10&nbsp;���ҷ�����ԭ���µĹ��̱�����ҷ���ȨҪ��׷�ӱ��ꡣ</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.11&nbsp;�ҷ������嵥Ҫ����Ҫ�ṩ�ĸ��ϵȣ���������׷������Һ���ҵ����ع涨�������ɴ˶����������������ҷ����ге���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.12&nbsp;����Ŀ����ǰ2�գ��ҷ�Ӧ��פ�ش����Լ��ֳ�ʩ����Ա���������ֳ�ʩ����Ա��ϸ�������͸��׷����������涨��ʱ������ر���������δ������ر���������Ա���ý���ʩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�����ҷ�δ��ʱ��׼ȷ�ṩ�׷��ֳ�ʩ����Ա����Ӱ�������ر�������������ʩ���������¹ʼ�����������⳥�����ҷ����ге�ȫ�����Σ���׷��޹أ���˸��׷������ʧ���׷�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >��Ȩ׷����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>8��ʩ�����������</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.1&nbsp;�ҷ������ϸ��ռ׷���Ŀ����ʽ�·�������ʩ�����ȼƻ���ʩ�������¼ƻ���ʩ�������ܼƻ�����֯ʩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.2&nbsp;�����ҷ�����ԭ�������������û�а���ȷ��������ȼƻ���ɵģ��׷���Ȩ�۳��ҷ���ͬ�����ܼۿ��<u>5 %</u>��Ϊ����ΥԼ�������ҷ�����ԭ��û�а��ռ׷���ȷ���·���ʩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�ȼƻ���ɵģ��׷�������ڸ����ҷ�<u>500~1,000Ԫ/��</u>�Ľ���ΥԼ�������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.3&nbsp;�ڱ���ͬ�涨���ҷ�ʩ������δȫ��ʩ�����ǰ���ҷ��޹�ͣ����ɼ׷���ʧ�ģ�Ӧ�е��⳥���Σ����ҷ��޹�ͣ������<u>3��</u>��δ�����ģ���׷���Ȩ�����ͬ��������ѡ���������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >δ�깤���̣��Ҽ׷����ҷ����깤�̲�����㣬��֧���κη��á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.4&nbsp;���ҷ�ԭ����������أ���ͣˮ��ͣ�糬��8Сʱ���׷�δ��ʱ�ṩ���ġ��ش���Ʊ���������йع涨�����ɿ����ȣ���ɵĲ�������ʩ����������ڿ���˳�ӣ������������ʧ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >��˫��Э�̽����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>9��������������</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.1&nbsp;�ҷ������ϸ���ʩ��ͼֽ������估�׷���Ŀ����Ҫ�����ʩ�������幤���������ձ�׼Ҫ�ﵽ�������պϸ��׼��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.2&nbsp;����̵�ʩ��������������ﵽ<b><u>����</u></b>��׼������һ�ν���ϸ��ʴﵽ<u>100%</u>���������������ʴﵽ<u>100%</u>��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.3&nbsp;�ҷ������ϸ��ռ׷���Ŀ���·���ʩ��������ʩ��������׼����ʩ��������������ļ׷���Ŀ���·���ʩ��������ʩ��������׼��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.4&nbsp;�ҷ���������������ȼ������������Լ����������׼�ȼ����׷���Ȩ�۳��ҷ���ͬ�����ܼۿ��<u><b>5 %</b></u>��Ϊ����ΥԼ���Ҽ׷���Ȩѡ�����������ά�޺Ͳ��ȣ��������ķ���ȫ</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�����ҷ��е���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.5&nbsp;�׷����̵�����Ա���ҷ�ʩ���ķ���̽��и��ټ�飬��ʩ������������Ҫ��ģ��ҷ������������ؼ�ʱ���ģ����򣬼׷�������ڸ����ҷ�<u>500-1,000Ԫ/��</u>�������������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�ҷ�����������ļ׷��ṩ�ĸ���Ʒ�ƣ���ȷ�����ͬ���β��ϣ��뱨�׷����̵�����Ա��׼�������ͬʱ����Ӧ��Ϣ���׷���۲����緢��δ���������Ը��������Ӹ��Ŀ��п۳��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >����Դ�����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>10����ȫ����������ʩ��</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.1&nbsp;�ҷ�Ӧ�ϸ����ع��Ҽ��ط����ڰ�ȫ����������ʩ���ĸ���ɡ����漰������ͬʱ�ҷ�Ӧ�ϸ����ؼ׷��ڱ������ж԰�ȫ����������ʩ���ľ���Ҫ���������ȫ�¹ʣ�����ȷ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >����˫�����ι�������ɵķ������κ;������������η����ге�����������ɾ����ɳ����չ����йع涨�����������ʩ���ڼ��ҷ������κ�����ΰ����⣬�����ҷ����ге���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.2&nbsp;�ҷ���ʩ����Ա����ǰ�����뾭��������ȫ�����Ͱ�ȫ����������ѵ�����Ժϸ�󷽿��ϸڹ��������⹤�������Ч�ϸ�֤�������ϸڲ�����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.3&nbsp;�ҷ�ʩ����Ա��ʩ��ʱ��Ӧ�ϸ�ִ�м׷���Ŀ���ƶ��İ�ȫ������ʩ�Ͱ�ȫ�������׵ĸ���Ҫ���ϸ�������صİ�ȫ����������̼����ȫ�涨�����������豸����ȫ����װ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >����ʩ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.4&nbsp;�ҷ�����ʩ���ֳ���ҵ��������Ա��������ܼ׷��ֳ�������Ա�İ�ȫ�����ͼල�����ڲ����Ӽ׷���Ŀ��������Ա������Υ���ֳ���ȫ����������ʩ�������涨�ģ��׷��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�����ҷ�<u>100~500Ԫ/�˴�</u>�ķ��������̬��Ұ�����Ž̲��ĵ���Ա���׷��������ҷ��ӱ��������ҷ������������Ա���ʩ���ֳ���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.5&nbsp;��������Ա���ô���������ҵ��������Ա�Ͻ��Ҷ�ʩ���ֳ�����ˮ���ٵ���·�����ֻ�е�豸�����򣬷���һ�к�����������ҷ����ге��������ҷ�����ʩ��ԭ����������©ˮ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >©�缰�����¹ʵȣ������μ���ɵĸ�����ʧ�����ҷ����ге���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.6&nbsp;�ҷ����κ���Ա�������������ƶ��ֳ����е�Ϊȷ��ʩ����ȫ�����õ�һ�з�����ʩ������׷�������ڸ����ҷ�<u>200~500Ԫ/��</u>�ķ�������ɴ���ɵİ�ȫ�������ҷ����ге�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.7&nbsp;��ʩ�����ҷ���Ա�������ˡ��׷�������Ա���������ģ���������ع涨�������ι�����ͬʱ���չ��ҷ��ɹ涨�������⣬��������˫���ɾ�����;������� </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.8&nbsp;�ҷ������ζ����깤�̳�Ʒ���б������緢�ֶԳ�Ʒ����������Բ�Ʒ����ƻ��ģ����ָ�ԭ״�⣬�׷�������ڸ����ҷ�<u>500Ԫ��1,000Ԫ/��</u>�������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.9&nbsp;�ҷ�������������ֳ�ԭ����ʩ���绤����ů���ȣ�������ָ�ԭ״�⣬�׷�������ڸ����ҷ��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>11���ù�����</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;11.1&nbsp;�ҷ����ϸ����ع���ʩ����ҵ�ù���������ط��ɡ����漰���������ع��Ҽ��ط�����ũ���ù���������ع涨���κ������ҷ�Υ���������ɡ����桢�������涨����ɵľ�����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�μ��������ξ����ҷ��е���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>12��ʩ���ֳ�����</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.1&nbsp;�ҷ��������ع��ҡ��ط����׷������ֳ�ʩ�������ĸ���涨���ƶȣ�����ʩ��Ͷ�롢�ֳ��Ĳ��õȸ����涼Ҫ�ϸ��ռ׷��Ĺ涨ִ�С�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.2&nbsp;�ҷ��ֳ�������ʩ����Ա����ͳһ���ż׷��涨�ķ�װ������׷��涨�ķ����þߣ��ﲻ��Ҫ��ģ��׷������������<u>50~100Ԫ/�˴�</u>�ķ������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.3&nbsp;�ҷ�Ӧ�ò�ȡһ�к����Ĵ�ʩ��ֹ�乤�˷����κ�Υ��������������ΰ��͹�����ȫ����Ϊ��������ȫ�����κ����񱣻���Χ������Ա�ͲƲ�����������Ϊ��Σ�����ɴ����һ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >������ҷ�����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.4&nbsp;�ҷ�Ӧ�ϸ����ش����м��׷��й�ʩ���ֳ���������������ͨ��ȫ������������ΰ�����Ĺ涨�����������ҷ�����ԭ�����ɵ�һ���¹ʡ��ֺ����������¼��ȣ��侭�����μ���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >���������ҷ����Գе����ɴ���ɼ׷�����ʧ���ҷ��⳥���׷���Ȩ������д���������ͻ������ʧ���ҷ��������յ�������3��֮�ڽɿ��δ���ڽ��ɣ��׷���Ȩ�ӵ���Ӧ������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�۳���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.5&nbsp;�ҷ�Ҫ��ʱ��������ʩ�������ʩ���������������곡�壻�������ҷ���ԭ��û�м�ʱ����ʩ�������ģ��׷������������<u>500~1,000Ԫ/��</u>�ķ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.6&nbsp;�ҷ�ȷ�����ֳ������˱��뱣֤ʱ���ڹ����ֳ���δ���׷�������ͬ�ⲻ�������뿪�ֳ�������׷��������ҷ�<u>500Ԫ/��</u>�ķ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.7&nbsp;�ҷ�ȷ�����ֳ������˱���׼ʱ�μӼ׷���Ŀ����֯���й�ʩ����������ȫ�������ȷ���Ļ��飬���ҷ���Ա�޹ʳٵ��ģ��׷�������ڸ���<u>100~200Ԫ/��</u>�ķ�����ҷ���Ա�޹�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >ȱϯ�ģ��׷�������ڸ���<u>200~500Ԫ/��</u>�ķ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>13����ͬ��Ч����ֹ</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����ͬ��ǩ�ָ���֮������Ч��������˫����������Ե�Ȩ������򰴱���ͬ�йع涨�����ͬ�󣬱���ͬ������ֹ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>14������Ľ������</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����ͬ�����й����У����������飬�ɼ���˫��Э�̽����Э�̲��ɵģ�������׷����ڵ�����Ժ���ߡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>15����ͬ����</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����ͬһʽ���ݣ��׷�ִҼ�ݣ��ҷ�ִҼ�ݡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >�����������ģ�</td>
   </tr>
   </table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >�׷���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	   <td width="50%"  height="40" >�ҷ���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <BR>  
     <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >�������ĕr��װ�����޹�˾ </td>
	   <td width="50%"  height="40" >&nbsp;</td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >���������ˣ� </td>
       <td width="50%"  height="40" >&nbsp;</td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >�ܾ����� </td>
       <td width="50%"  height="40" >&nbsp;</td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >�����쵼��</td>
       <td width="50%"  height="40" >&nbsp;</td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >��&nbsp;��&nbsp;�ˣ�  </td>
	   <td width="50%"  height="40" >&nbsp;</td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >ǩ�����ڣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��   </td>
	   <td width="50%"  height="40" >&nbsp;</td>
  </tr>
</table>
</body>
</html> 
