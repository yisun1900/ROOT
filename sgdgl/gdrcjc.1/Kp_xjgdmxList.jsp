<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String xjjlh=request.getParameter("xjjlh");

	ls_sql="SELECT '�޸�' xg,'ɾ��' sc,kp_xjgdmx.xjjlh as xjjlh,kp_xjgdmx.kpxmbm as kpxmbm,kp_gckpxm.kpxmmc,kp_xjgdmx.kpjg, DECODE(kp_xjgdmx.kpjg,'1','��΢Υ��','2','����Υ��','3','�ر�����') as kpjgmc,kp_xjgdmx.kpcfbm as kpcfbm,kp_kpdlbm.kpdlmc,kp_xjgdmx.kf,kp_xjgdmx.sgdfk,kp_xjgdmx.kcjdebl||'%' kcjdebl,wzcs,kp_kpcfbm.kpcfmc,kp_xjgdmx.bz  ";
	ls_sql+=" FROM kp_xjgdmx,kp_gckpxm,kp_kpdlbm,kp_kpcfbm  ";
    ls_sql+=" where kp_xjgdmx.kpxmbm=kp_gckpxm.kpxmbm and kp_xjgdmx.kpjg=kp_gckpxm.kpjg and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm";
    ls_sql+=" and kp_xjgdmx.kpcfbm=kp_kpcfbm.kpcfbm(+) ";
    ls_sql+=" and kp_xjgdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_xjgdmx.kpxmbm,kp_xjgdmx.kpjg";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"kpdlmc","xg","sc","kpxmmc","kpjgmc","kf","sgdfk","kcjdebl","wzcs","kpcfmc","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"xjjlh","kpxmbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="yrk_editmain.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target=_blank";//
	coluParmHash.put("xg",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"xjjlh","kpxmbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="DeleteKp_xjgdmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target=_blank";//
	coluParmHash.put("sc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_kpdlbm_kpdlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER ><B>ʩ���Ӽ����ϸ(����¼�ţ�<%=xjjlh%>)</B></CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">��Ŀ����</td>
	<td  width="5%">�޸�</td>
	<td  width="5%">ɾ��</td>
	<td  width="12%">�����Ŀ</td>
	<td  width="8%">Υ��ּ�</td>
	<td  width="8%">���ο۷�</td>
	<td  width="9%">���η���</td>
	<td  width="9%">�۳��ӵ���ٷֱ�</td>
	<td  width="7%">Υ�´���</td>
	<td  width="14%">��������</td>
	<td  width="30%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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