<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String kpjlh=null;
	kpjlh=request.getParameter("kpjlh");

	ls_sql="SELECT kp_sgdkpjg.kpjlh as kpjlh,kp_sgdkpjg.sgd,sgdmc as sq_dwxx_dwmc,sq_sgdjbbm.sgdjbmc as sq_sgdjbbm_sgdjbmc,kp_sgdkpjg.zbj as kp_sgdkpjg_zbj,kp_sgdkpjg.bzs as kp_sgdkpjg_bzs,kp_sgdkpjg.jcf as kp_sgdkpjg_jcf,kp_sgdkpjg.kpgds as kp_sgdkpjg_kpgds,kp_sgdkpjg.zjyzldf as kp_sgdkpjg_zjyzldf,kp_sgdkpjg.xjyzldf as kp_sgdkpjg_xjyzldf,kp_sgdkpjg.cczldf as kp_sgdkpjg_cczldf,kp_sgdkpjg.zjyaqdf as kp_sgdkpjg_zjyaqdf,kp_sgdkpjg.xjyaqdf as kp_sgdkpjg_xjyaqdf,kp_sgdkpjg.ccaqdf as kp_sgdkpjg_ccaqdf,kp_sgdkpjg.zjygqdf as kp_sgdkpjg_zjygqdf,kp_sgdkpjg.zjygldf as kp_sgdkpjg_zjygldf,kp_sgdkpjg.xjygldf as kp_sgdkpjg_xjygldf,kp_sgdkpjg.ccgldf as kp_sgdkpjg_ccgldf,kp_sgdkpjg.khpjdf as kp_sgdkpjg_khpjdf,kp_sgdkpjg.tsdf as kp_sgdkpjg_tsdf,kp_sgdkpjg.wxdf as kp_sgdkpjg_wxdf,kp_sgdkpjg.ybjdf as kp_sgdkpjg_ybjdf,kp_sgdkpjg.bqdf as kp_sgdkpjg_bqdf,kp_sgdkpjg.sqzf as kp_sgdkpjg_sqzf,kp_sgdkpjg.bqzf as kp_sgdkpjg_bqzf,kp_sgdkpjg.sqpm as kp_sgdkpjg_sqpm,kp_sgdkpjg.bqpm as kp_sgdkpjg_bqpm, DECODE(kp_sgdkpjg.pmfd,'1','1��15λ','2','16��45λ','3','46λ�Ժ�') as kp_sgdkpjg_pmfd, DECODE(kp_sgdkpjg.hjwbz,'Y','��','N','��') as kp_sgdkpjg_hjwbz, DECODE(kp_sgdkpjg.qjwbz,'Y','��','N','��') as kp_sgdkpjg_qjwbz, DECODE(kp_sgdkpjg.sjbz,'Y','��','N','��') as kp_sgdkpjg_sjbz, DECODE(kp_sgdkpjg.jjbz,'Y','��','N','��') as kp_sgdkpjg_jjbz,kp_sgdkpjg.ddbl*100||'%' as kp_sgdkpjg_ddbl,kp_sgdkpjg.zdbl*100||'%' as kp_sgdkpjg_zdbl,kp_sgdkpjg.xdbl*100||'%' as kp_sgdkpjg_xdbl,kp_sgdkpjg.ddbzs as kp_sgdkpjg_ddbzs,kp_sgdkpjg.zdbzs as kp_sgdkpjg_zdbzs,kp_sgdkpjg.xdbzs as kp_sgdkpjg_xdbzs,kp_sgdkpjg.ddjls as kp_sgdkpjg_ddjls,kp_sgdkpjg.zdjls as kp_sgdkpjg_zdjls,kp_sgdkpjg.xdjls as kp_sgdkpjg_xdjls,kp_sgdkpjg.kdds as kp_sgdkpjg_kdds,kp_sgdkpjg.kzds as kp_sgdkpjg_kzds,kp_sgdkpjg.kxds as kp_sgdkpjg_kxds,kp_sgdkpjg.tsjcdd as kp_sgdkpjg_tsjcdd,kp_sgdkpjg.tsjczd as kp_sgdkpjg_tsjczd,kp_sgdkpjg.tsjcxd as kp_sgdkpjg_tsjcxd,kp_sgdkpjg.kjdds as kp_sgdkpjg_kjdds,kp_sgdkpjg.kjzds as kp_sgdkpjg_kjzds,kp_sgdkpjg.kjxds as kp_sgdkpjg_kjxds,kp_sgdkpjg.kjdzs as kp_sgdkpjg_kjdzs,kp_sgdkpjg.kjdze as kp_sgdkpjg_kjdze,kp_sgdkpjg.yjdds as kp_sgdkpjg_yjdds,kp_sgdkpjg.yjddje as kp_sgdkpjg_yjddje,kp_sgdkpjg.yjzds as kp_sgdkpjg_yjzds,kp_sgdkpjg.yjzdje as kp_sgdkpjg_yjzdje,kp_sgdkpjg.yjxds as kp_sgdkpjg_yjxds,kp_sgdkpjg.yjxdje as kp_sgdkpjg_yjxdje,kp_sgdkpjg.ywgs as kp_sgdkpjg_ywgs,kp_sgdkpjg.zsgds as kp_sgdkpjg_zsgds  ";
	ls_sql+=" FROM kp_sgdkpjg,sq_sgd,sq_sgdjbbm  ";
    ls_sql+=" where kp_sgdkpjg.sgdjbbm=sq_sgdjbbm.sgdjbbm(+) and kp_sgdkpjg.sgd=sq_sgd.sgd";
    ls_sql+=" and kp_sgdkpjg.kpjlh="+kpjlh;
    ls_sql+=" order by bqpm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
//������ʾ��
	String[] disColName={"kp_sgdkpjg_bqpm","sq_dwxx_dwmc","kp_sgdkpjg_bqzf","kp_sgdkpjg_kjdds","kp_sgdkpjg_kjzds","kp_sgdkpjg_kjxds","kp_sgdkpjg_kjdzs","kp_sgdkpjg_kjdze","kp_sgdkpjg_yjdds","kp_sgdkpjg_yjddje","kp_sgdkpjg_yjzds","kp_sgdkpjg_yjzdje","kp_sgdkpjg_yjxds","kp_sgdkpjg_yjxdje","kp_sgdkpjg_bqdf","kp_sgdkpjg_sqzf","kp_sgdkpjg_sqpm","kp_sgdkpjg_pmfd","kp_sgdkpjg_hjwbz","kp_sgdkpjg_qjwbz","kp_sgdkpjg_sjbz","kp_sgdkpjg_jjbz","sq_sgdjbbm_sgdjbmc","kp_sgdkpjg_zbj","kp_sgdkpjg_bzs","kp_sgdkpjg_jcf","kp_sgdkpjg_kpgds","kp_sgdkpjg_zjyzldf","kp_sgdkpjg_xjyzldf","kp_sgdkpjg_cczldf","kp_sgdkpjg_zjyaqdf","kp_sgdkpjg_xjyaqdf","kp_sgdkpjg_ccaqdf","kp_sgdkpjg_zjygqdf","kp_sgdkpjg_zjygldf","kp_sgdkpjg_xjygldf","kp_sgdkpjg_ccgldf","kp_sgdkpjg_khpjdf","kp_sgdkpjg_tsdf","kp_sgdkpjg_wxdf","kp_sgdkpjg_ybjdf","kp_sgdkpjg_ddbl","kp_sgdkpjg_zdbl","kp_sgdkpjg_xdbl","kp_sgdkpjg_ddbzs","kp_sgdkpjg_zdbzs","kp_sgdkpjg_xdbzs","kp_sgdkpjg_ddjls","kp_sgdkpjg_zdjls","kp_sgdkpjg_xdjls","kp_sgdkpjg_kdds","kp_sgdkpjg_kzds","kp_sgdkpjg_kxds","kp_sgdkpjg_tsjcdd","kp_sgdkpjg_tsjczd","kp_sgdkpjg_tsjcxd","kp_sgdkpjg_ywgs","kp_sgdkpjg_zsgds"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"kpjlh","sgd"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"kpjlh","sgd"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_sgdkpjg.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sq_dwxx_dwmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">��������</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">�����ܷ�</td>
	<td  width="1%">�����ڿɽӴ�����</td>
	<td  width="1%">�����ڿɽ��е�����</td>
	<td  width="1%">�����ڿɽ�С������</td>
	<td  width="1%">�����ڿɽӵ�����</td>
	<td  width="1%">�����ڿɽӵ��ܶ�</td>
	<td  width="1%">�ѽӴ���</td>
	<td  width="1%">�ѽӴ󵥽��</td>
	<td  width="1%">�ѽ��е���</td>
	<td  width="1%">�ѽ��е����</td>
	<td  width="1%">�ѽ�С����</td>
	<td  width="1%">�ѽ�С�����</td>
	<td  width="1%">���ڵ÷�</td>
	<td  width="1%">��ʷ�ܵ÷�</td>
	<td  width="1%">��������</td>
	<td  width="1%">���������ֶ�</td>
	<td  width="1%">���3λ��־</td>
	<td  width="1%">ǰ5λ��־</td>
	<td  width="1%">������־</td>
	<td  width="1%">������־</td>
	<td  width="1%">ʩ���Ӽ���</td>
	<td  width="1%">�ʱ���</td>
	<td  width="1%">������</td>
	<td  width="1%">������</td>
	<td  width="1%">����������</td>
	<td  width="1%">�ʼ�Ա�����÷�</td>
	<td  width="1%">Ѳ��Ա�����÷�</td>
	<td  width="1%">��˾��������÷�</td>
	<td  width="1%">�ʼ�Ա��ȫ����ʩ���÷�</td>
	<td  width="1%">Ѳ��Ա��ȫ����ʩ���÷�</td>
	<td  width="1%">��˾��鰲ȫ����ʩ���÷�</td>
	<td  width="1%">�ʼ�Ա���ڵ÷�</td>
	<td  width="1%">�ʼ�Ա����÷�</td>
	<td  width="1%">Ѳ��Ա����÷�</td>
	<td  width="1%">��˾������÷�</td>
	<td  width="1%">�ͻ����۵÷�</td>
	<td  width="1%">Ͷ����÷�</td>
	<td  width="1%">ά����÷�</td>
	<td  width="1%">�������÷�</td>
	<td  width="1%">�󵥱���</td>
	<td  width="1%">�е�����</td>
	<td  width="1%">С������</td>
	<td  width="1%">�ɽӴ󵥱�׼��</td>
	<td  width="1%">�ɽ��е���׼��</td>
	<td  width="1%">�ɽ�С����׼��</td>
	<td  width="1%">�󵥻ص�������</td>
	<td  width="1%">�е��ص�������</td>
	<td  width="1%">С���ص�������</td>
	<td  width="1%">�ش�Ͷ�߿۴�</td>
	<td  width="1%">�ش�Ͷ�߿��е�</td>
	<td  width="1%">�ش�Ͷ�߿�С��</td>
	<td  width="1%">���⽱���򴦷���</td>
	<td  width="1%">���⽱���򴦷��е�</td>
	<td  width="1%">���⽱���򴦷�С��</td>
	<td  width="1%">���깤��</td>
	<td  width="1%">��ʩ������</td>
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