<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;


	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String dwbh=request.getParameter("dwbh");

	ls_sql=" SELECT n.dwmc zxdm,DECODE(zxzt,'0','δ�������','1','�������','2','�ɵ����δͨ��','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') zt,crm_zxkhxx.hth,crm_zxkhxx.khxm,crm_zxkhxx.sjs,crm_zxkhxx.fwdz,a.fklxmc fklxbm,cw_khfkjl.fkje,zffsmc,b.fklxmc zckx,cw_khfkjl.zcgysbh,cw_khfkjl.fkxh,NVL2(cw_khfkjl.yfkbl,cw_khfkjl.yfkbl||'%',''),cw_khfkjl.yfkje,DECODE(skdd,'1','������','2','�ǲ������'),DECODE(dsksjbz,'N','δ���','Y','���ͨ��','M','���δͨ��'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,m.dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(scbz,'N','δɾ��','Y','ɾ��'),scr,scsj,DECODE(cw_khfkjl.gljlbz,'N','�ǹ���','Y','����'),cw_khfkjl.glxh,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,crm_zxkhxx,sq_dwxx m,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,sq_dwxx n  ";
	ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh(+) and cw_khfkjl.skdw=m.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and crm_zxkhxx.zxdm=n.dwbh ";

	ls_sql+=" and (cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')) ";
	ls_sql+=" and (cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')) ";
	ls_sql+=" and (cw_khfkjl.scbz='N') ";
	ls_sql+=" and (crm_zxkhxx.ssfgs='"+dwbh+"') ";
	ls_sql+=" and (cw_khfkjl.fklxbm='53') ";
	ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
	ls_sql+=" order by crm_zxkhxx.zxdm,crm_zxkhxx.zxzt,crm_zxkhxx.khxm";


//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","fkxh","cw_khfkjl_sjbh","cw_khfkjl_jsjlh","cw_khfkjl_fklx","cw_khfkjl_fkje","cw_khfkjl_skr","cw_khfkjl_sksj","cw_khfkjl_lrdw","cw_khfkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fkxh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"fkxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/cwgl/qyecx/ViewCw_khfkjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fkxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"fkxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/cwgl/qyecx/ViewKhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zxdm","1");//�в����������Hash��
	spanColHash.put("zt","1");//�в����������Hash��
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("fklxbm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ƷѸ�����ϸ<B><font color="#FF0000">��ע�⣺�������շѶ�δ�Ͻɲ��񲻼��룩</font></B></font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��������</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">���ʦ</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="4%">�տ�����</td>
	<td  width="4%">ʵ�տ���</td>
	<td  width="2%">֧����ʽ</td>
	<td  width="4%">ת������</td>
	<td  width="6%">ת����Ʒ��</td>
	<td  width="3%">�տ����</td>
	<td  width="2%">Ӧ�տ���</td>
	<td  width="4%">Ӧ�տ���</td>
	<td  width="3%">�Ƿ�����տ�</td>
	<td  width="2%">���տ��Ͻ�</td>
	<td  width="5%">�վݱ��</td>
	<td  width="2%">�տ���</td>
	<td  width="3%">�տ�ʱ��</td>
	<td  width="5%">�տλ</td>
	<td  width="2%">�����տ���</td>
	<td  width="3%">�����տ�ʱ��</td>
	<td  width="2%">ɾ����־</td>
	<td  width="2%">ɾ����</td>
	<td  width="3%">ɾ��ʱ��</td>
	<td  width="2%">������¼��־</td>
	<td  width="2%">�������</td>
	<td  width="16%">��ע</td>
</tr>
<%
	pageObj.printDateSum();
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
