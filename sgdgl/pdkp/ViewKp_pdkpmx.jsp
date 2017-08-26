<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String kpjlh=request.getParameter("kpjlh");

	ls_sql="SELECT kp_pdkpmx.bqpm,TO_CHAR(kp_pdkpmx.bqdf),kp_pdkpmx.kpzf,sq_sgd.sgdmc, DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��'),kp_pdkpmx.zbj,kp_pdkpmx.bzs,sgdjbmc,TO_CHAR(kp_pdkpmx.jdqz),kp_pdkpmx.ddbl||'%',kp_pdkpmx.zdbl||'%',kp_pdkpmx.xdbl||'%',kp_pdkpmx.kcjdebfb||'%',kp_pdkpmx.zdjdze,kp_pdkpmx.kjhzdfpe,kp_pdkpmx.lljdze,kp_pdkpmx.jdze,kp_pdkpmx.lljdde,kp_pdkpmx.ddje,kp_pdkpmx.lljzde,kp_pdkpmx.zdje,kp_pdkpmx.lljxde,kp_pdkpmx.xdje,kp_pdkpmx.sqsydze,kp_pdkpmx.sqsydde,kp_pdkpmx.sqsyzde,kp_pdkpmx.sqsyxde,kp_pdkpmx.sqpdbcze,kp_pdkpmx.sqpdbcdde,kp_pdkpmx.sqpdbczde,kp_pdkpmx.sqpdbcxde,kp_pdkpmx.bqjdze,kp_pdkpmx.bqdde,kp_pdkpmx.bqzde,kp_pdkpmx.bqxde,kp_pdkpmx.yjdze,kp_pdkpmx.yjddje,kp_pdkpmx.yjzdje,kp_pdkpmx.yjxdje,kp_pdkpmx.jfdze,kp_pdkpmx.jfddje,kp_pdkpmx.jfzdje,kp_pdkpmx.jfxdje,kp_pdkpmx.sydze,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje,TO_CHAR(kp_pdkpmx.sqpm),DECODE(kp_pdkpmx.hjwbz,'Y','��','N','��'),DECODE(kp_pdkpmx.qjwbz,'Y','��','N','��'),DECODE(kp_pdkpmx.sjbz,'Y','��','N','��'),DECODE(kp_pdkpmx.jjbz,'Y','��','N','��'),kp_pdkpmx.jcf  ";
	ls_sql+=" FROM sq_sgd,kp_pdkpmx,sq_sgdjbbm  ";
    ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.sgdjbbm=sq_sgdjbbm.sgdjbbm(+)";
    ls_sql+=" and kp_pdkpmx.kpjlh='"+kpjlh+"'";
    ls_sql+=" order by kp_pdkpmx.kpjlh,kp_pdkpmx.sgdlx desc,kp_pdkpmx.bqpm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kpjlh","sq_sgd_sgdmc","kp_pdkpmx_sgdlx","kp_pdkpmx_zbj","kp_pdkpmx_bzs","kp_pdkpmx_jcf","kp_pdkpmx_sgdjbbm","kp_pdkpmx_jdqz","kp_pdkpmx_ddbl","kp_pdkpmx_zdbl","kp_pdkpmx_xdbl","kp_pdkpmx_bqdf","kp_pdkpmx_bqpm","kp_pdkpmx_kpzf","kp_pdkpmx_sqpm","kp_pdkpmx_hjwbz","kp_pdkpmx_qjwbz","kp_pdkpmx_sjbz","kp_pdkpmx_jjbz","kp_pdkpmx_kcjdebfb","kp_pdkpmx_zdjdze","kp_pdkpmx_lljdze","kp_pdkpmx_jdze","kp_pdkpmx_lljdde","kp_pdkpmx_ddje","kp_pdkpmx_lljzde","kp_pdkpmx_zdje","kp_pdkpmx_lljxde","kp_pdkpmx_xdje","kp_pdkpmx_sqsydze","kp_pdkpmx_sqsydde","kp_pdkpmx_sqsyzde","kp_pdkpmx_sqsyxde","kp_pdkpmx_sqpdbcze","kp_pdkpmx_sqpdbcdde","kp_pdkpmx_sqpdbczde","kp_pdkpmx_sqpdbcxde","kp_pdkpmx_bqjdze","kp_pdkpmx_bqdde","kp_pdkpmx_bqzde","kp_pdkpmx_bqxde","kp_pdkpmx_yjdze","kp_pdkpmx_yjddje","kp_pdkpmx_yjzdje","kp_pdkpmx_yjxdje","kp_pdkpmx_jfdze","kp_pdkpmx_jfddje","kp_pdkpmx_jfzdje","kp_pdkpmx_jfxdje","kp_pdkpmx_sydze","kp_pdkpmx_syddje","kp_pdkpmx_syzdje","kp_pdkpmx_syxdje"};
	pageObj.setDisColName(disColName);
*/

/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ�����ɵ�������������¼�ţ�<%=kpjlh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(319);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="30">��������</td>
	<td  width="40">���ڵ÷�</td>
	<td  width="62">�����ܷ�</td>
	<td  width="50">ʩ��������</td>
	<td  width="40">ʩ��������</td>
	<td  width="55">�ʱ���</td>
	<td  width="45">������</td>
	<td  width="40">ʩ���Ӽ���</td>
	<td  width="35">�ӵ�Ȩ��</td>
	<td  width="35">�󵥱���</td>
	<td  width="35">�е�����</td>
	<td  width="35">С������</td>
	<td  width="40">�۳��ӵ��ܶ�ٷֱ�</td>
	<td  width="62">���ӵ��ܶ�</td>
	<td  width="62">�ۼ��������䵥��</td>
	<td  width="62">���۽ӵ��ܶ�</td>
	<td  width="62">�ӵ��ܶ�</td>
	<td  width="62">���۽Ӵ󵥶�</td>
	<td  width="62">�󵥽��</td>
	<td  width="62">���۽��е���</td>
	<td  width="62">�е����</td>
	<td  width="62">���۽�С����</td>
	<td  width="62">С�����</td>
	<td  width="62">����ʣ�൥�ܶ�</td>
	<td  width="62">����ʣ��󵥶�</td>
	<td  width="62">����ʣ���е���</td>
	<td  width="62">����ʣ��С����</td>
	<td  width="62">�����ɵ������ܶ�</td>
	<td  width="62">�����ɵ������󵥶�</td>
	<td  width="62">�����ɵ������е���</td>
	<td  width="62">�����ɵ�����С����</td>
	<td  width="62">���ڽӵ��ܶ�</td>
	<td  width="62">���ڴ󵥶�</td>
	<td  width="62">�����е���</td>
	<td  width="62">����С����</td>
	<td  width="62">�ѽӵ��ܶ�</td>
	<td  width="62">�ѽӴ󵥽��</td>
	<td  width="62">�ѽ��е����</td>
	<td  width="62">�ѽ�С�����</td>
	<td  width="62">�������ܶ�</td>
	<td  width="62">�����󵥽��</td>
	<td  width="62">�����е����</td>
	<td  width="62">����С�����</td>
	<td  width="62">ʣ�൥�ܶ�</td>
	<td  width="62">ʣ��󵥽��</td>
	<td  width="62">ʣ���е����</td>
	<td  width="62">ʣ��С�����</td>
	<td  width="40">��������</td>
	<td  width="40">���3λ��־</td>
	<td  width="40">ǰ5λ��־</td>
	<td  width="40">������־</td>
	<td  width="40">������־</td>
	<td  width="50">������</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>