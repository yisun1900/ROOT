<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����δͨ��</font></B>
</CENTER>

<table border="1" width="300%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">�����¼��</td>
	<td  width="3%">�������</td>
	<td  width="2%">��������</td>
	<td  width="10%">�������</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">��װ��־</td>
	<td  width="3%">δ���۹��̶�</td>
	<td  width="3%">����ǩԼ��</td>
	<td  width="2%">�ۿ���</td>
	<td  width="2%">��������</td>
	<td  width="3%">�ͻ�������</td>
	<td  width="3%">����ʵ�տ��ܶ�</td>
	<td  width="3%">������</td>
	<td  width="2%">��������</td>
	<td  width="2%">�����</td>
	<td  width="2%">ά�޽�</td>
	<td  width="2%">���̿ۿ�</td>
	<td  width="2%">��ˮ���</td>
	<td  width="2%">��������</td>
	<td  width="2%">����</td>
	<td  width="3%">���ӽ�����ܶ�</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="4%">���㵥λ</td>
	<td  width="2%">�ͻ����</td>
	<td  width="6%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT cw_gdjsjl.gdjsjlh,DECODE(cw_gdjsjl.jsjd,'1','���㲿����','2','��������','3','�������'),DECODE(cw_gdjsjl.spjl,'3','ͨ��','4','δͨ��'),cw_gdjsjl.spyj,crm_khxx.khxm,crm_khxx.fwdz,sgdmc, DECODE(cw_gdjsjl.jzbz,'1','��װ','2','��װ'),cw_gdjsjl.wdzgce,cw_gdjsjl.qye,cw_gdjsjl.zkl,cw_gdjsjl.zjxje,cw_gdjsjl.khjskze,cw_gdjsjl.khsskze, DECODE(cw_gdjsjl.tdjs,'1','�ͻ�������','2','ʵ�տ�','3','ǩԼ��','4','ʵ�ʳɱ�'),cw_gdjsjl.glftd,cw_gdjsjl.glf,cw_gdjsjl.wxj,cw_gdjsjl.gckk,cw_gdjsjl.ksdf,cw_gdjsjl.kqtk,cw_gdjsjl.bk,cw_gdjsjl.gdjskze,cw_gdjsjl.jsr,cw_gdjsjl.jssj,dwmc,cw_gdjsjl.khbh,cw_gdjsjl.bz";
	ls_sql+=" FROM cw_gdjsjl,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gdjsjl.sgd=sq_sgd.sgd(+) and cw_gdjsjl.jsdw=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_gdjsjl.jsjd='2' and cw_gdjsjl.spjl='4'";//1�����㣻2������������3���������//3��ͨ����4��δͨ��
	ls_sql+=" order by cw_gdjsjl.jssj desc ";
    //out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditCw_gdjsjl.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>

</table>

<CENTER >
  <B><font size="3">�깤����(�����)</font></B>
</CENTER>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">��ͬ��</td>
	<td  width="5%">����</td>
	<td  width="7%">ǩԼ��</td>
	<td  width="5%">������</td>
	<td  width="7%">ʵ�տ�</td>
	<td  width="21%">���ݵ�ַ</td>
	<td  width="9%">ǩԼ����</td>
	<td  width="8%">ʵ��������</td>
	<td  width="7%">ʵ��������</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">�ʼ�Ա</td>
	<td  width="6%">�ͻ����</td>
</tr>

<%

	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs like '%"+lxfs+"%')";
	}

	ls_sql="SELECT hth,khxm,qye,zjxje,sfke,fwdz,a.dwmc sbdm,sjkgrq,sjjgrq,sgdmc sgd,sjs,zjxm,khbh ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)) and (gdjsjd='0' or gdjsjd is null) ";
    //ls_sql+="and zjxwcbz='2'";           //2006-12-25  ֻ������������Ĳ��ܽ���
	ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","InsertCw_gdjsjl.jsp","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","qyrq","kgrq","dwbh","sbrq","hdbz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("����");
	pageObj.setViewBolt("");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>

