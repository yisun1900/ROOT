<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	


//	ls_sql=" SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,'��ǩԼ' zt,a.fklxmc fklxbm,cw_khfkjl.fkje,zffsmc,cw_khfkjl.fkxh,DECODE(skdd,'1','������','2','�ǲ������'),DECODE(dsksjbz,'N','δ���','Y','���ͨ��','M','���δͨ��'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(cw_khfkjl.gljlbz,'N','�ǹ���','Y','����'),cw_khfkjl.glxh,cw_khfkjl.bz  ";
//	ls_sql+=" FROM cw_khfkjl,crm_khxx,sq_dwxx,cw_fklxbm a,cw_zffsbm  ";
//	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh(+) and cw_khfkjl.skdw=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
//	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm ";
//	ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
//	ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//	ls_sql+=" and cw_khfkjl.scbz='N' ";//N��δɾ����Y����ɾ��
//	ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53����Ʒ�
//	ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
//
// 	ls_sql+=" UNION ALL ";

	ls_sql=" SELECT crm_zxkhxx.hth,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,DECODE(zxzt,'0','δ�������','1','�������','2','�ɵ����δͨ��','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') zt,a.fklxmc fklxbm,cw_khfkjl.fkje,zffsmc,cw_khfkjl.fkxh,DECODE(skdd,'1','������','2','�ǲ������'),DECODE(dsksjbz,'N','δ���','Y','���ͨ��','M','���δͨ��'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(cw_khfkjl.gljlbz,'N','�ǹ���','Y','����'),cw_khfkjl.glxh,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,crm_zxkhxx,sq_dwxx,cw_fklxbm a,cw_zffsbm  ";
	ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh(+) and cw_khfkjl.skdw=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm ";
	ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and cw_khfkjl.scbz='N' ";//N��δɾ����Y����ɾ��
	ls_sql+=" and cw_khfkjl.fklxbm='53' ";
	//ls_sql+=" and crm_zxkhxx.zxzt!='3'  ";//53����Ʒ�
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"'";
 
	
	ls_sql+=" order by khxm,fklxbm,fkxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

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
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��ͬ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="3%">�տ�����</td>
	<td  width="5%">ʵ�տ���</td>
	<td  width="3%">֧����ʽ</td>
	<td  width="4%">�տ����</td>
	<td  width="5%">�Ƿ�����տ�</td>
	<td  width="3%">���տ��Ͻ�</td>
	<td  width="5%">�վݱ��</td>
	<td  width="3%">�տ���</td>
	<td  width="5%">�տ�ʱ��</td>
	<td  width="5%">�տλ</td>
	<td  width="3%">�����տ���</td>
	<td  width="5%">�����տ�ʱ��</td>
	<td  width="5%">������¼��־</td>
	<td  width="3%">�������</td>
	<td  width="19%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printSum();
	pageObj.displayFoot();
%> 

</body>
</html>
