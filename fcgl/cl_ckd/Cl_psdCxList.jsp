<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String psdh=null;
	String dwbh=null;
	String khbh=null;
	String pszsl=null;
	String pszje=null;
	String pszt=null;
	String lrr=null;
	String lrsj=null;
	String bz=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String fgs=null;

	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		if (!(lx.equals("")))	wheresql+=" and  (cl_psd.lx='"+lx+"')";
	}

	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=sgd.trim();
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	String psfs=null;
	psfs=request.getParameter("psfs");
	if (psfs!=null)
	{
		if (!(psfs.equals("")))	wheresql+=" and  (cl_psd.psfs='"+psfs+"')";
	}
	String jhshsj=null;
	jhshsj=request.getParameter("jhshsj");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (cl_psd.jhshsj>=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}
	jhshsj=request.getParameter("jhshsj2");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (cl_psd.jhshsj<=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}

	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_psd.dwbh='"+fgs+"')";
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
	psdh=request.getParameter("psdh");
	if (psdh!=null)
	{
		psdh=cf.GB2Uni(psdh);
		if (!(psdh.equals("")))	wheresql+=" and  (cl_psd.psdh='"+psdh+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cl_psd.dwbh='"+dwbh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (cl_psd.khbh='"+khbh+"')";
	}
	pszsl=request.getParameter("pszsl");
	if (pszsl!=null)
	{
		pszsl=pszsl.trim();
		if (!(pszsl.equals("")))	wheresql+=" and  (cl_psd.pszsl>="+pszsl+") ";
	}
	pszsl=request.getParameter("pszsl2");
	if (pszsl!=null)
	{
		pszsl=pszsl.trim();
		if (!(pszsl.equals("")))	wheresql+=" and  (cl_psd.pszsl<="+pszsl+") ";
	}
	pszje=request.getParameter("pszje");
	if (pszje!=null)
	{
		pszje=pszje.trim();
		if (!(pszje.equals("")))	wheresql+=" and  (cl_psd.pszje>="+pszje+") ";
	}
	pszje=request.getParameter("pszje2");
	if (pszje!=null)
	{
		pszje=pszje.trim();
		if (!(pszje.equals("")))	wheresql+=" and  (cl_psd.pszje<="+pszje+") ";
	}
	pszt=request.getParameter("pszt");
	if (pszt!=null)
	{
		pszt=cf.GB2Uni(pszt);
		if (!(pszt.equals("")))	wheresql+=" and  (cl_psd.pszt='"+pszt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cl_psd.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cl_psd.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cl_psd.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (cl_psd.bz='"+bz+"')";
	}

	ls_sql="SELECT cl_psd.psdh,DECODE(cl_psd.lx,'1','���','2','�˻�') lx,DECODE(cl_psd.pszt,'1','δ�ύ','2','���ύ','3','������') pszt,DECODE(cl_psd.psfs,'1','����','2','����','9','����'),cl_psd.jhshsj,dwmc,cl_psd.khbh,crm_khxx.khxm,crm_khxx.hth,sq_sgd.sgdmc,cl_psd.pszsl,cl_psd.pszje,cl_psd.fkje,cl_psd.lrr,cl_psd.lrsj,cl_psd.bz ";
	ls_sql+=" FROM cl_psd,sq_dwxx,crm_khxx,sq_sgd ";
    ls_sql+=" where cl_psd.dwbh=sq_dwxx.dwbh(+) and cl_psd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_psd.jhshsj ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cl_psdCxList.jsp","SelectCxCl_psd.jsp","","InsertCl_ckd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("����");
	pageObj.setEditBolt("");
/*
//������ʾ��
	String[] disColName={"psdh","dwbh","khbh","pszsl","pszje","pszt","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"psdh","khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"psdh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/fcgl/cl_psd/viewckmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("psdh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���͵�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">���͵���</td>
	<td  width="3%">����</td>
	<td  width="5%">����״̬</td>
	<td  width="5%">���ͷ�ʽ</td>
	<td  width="6%">�ƻ��ͻ�ʱ��</td>
	<td  width="8%">�ֹ�˾</td>
	<td  width="4%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="6%">��ͬ��</td>
	<td  width="5%">ʩ���ӳ�</td>
	<td  width="5%">����������</td>
	<td  width="6%">�����ܽ��</td>
	<td  width="6%">������</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="17%">��ע</td>
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