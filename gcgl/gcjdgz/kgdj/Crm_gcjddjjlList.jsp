<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_gcjddjjl_djjlh=null;
	String crm_gcjddjjl_khbh=null;
	String crm_gcjddjjl_gcjdbm=null;
	String crm_gcjddjjl_djsj=null;
	String crm_gcjddjjl_lrr=null;
	String crm_gcjddjjl_lrsj=null;
	String crm_khxx_hth=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_sjs=null;
	String dwbh=null;

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	crm_gcjddjjl_djjlh=request.getParameter("crm_gcjddjjl_djjlh");
	if (crm_gcjddjjl_djjlh!=null)
	{
		crm_gcjddjjl_djjlh=cf.GB2Uni(crm_gcjddjjl_djjlh);
		if (!(crm_gcjddjjl_djjlh.equals("")))	wheresql+=" and  (crm_gcjddjjl.djjlh='"+crm_gcjddjjl_djjlh+"')";
	}
	crm_gcjddjjl_khbh=request.getParameter("crm_gcjddjjl_khbh");
	if (crm_gcjddjjl_khbh!=null)
	{
		crm_gcjddjjl_khbh=cf.GB2Uni(crm_gcjddjjl_khbh);
		if (!(crm_gcjddjjl_khbh.equals("")))	wheresql+=" and  (crm_gcjddjjl.khbh='"+crm_gcjddjjl_khbh+"')";
	}
	crm_gcjddjjl_gcjdbm=request.getParameter("crm_gcjddjjl_gcjdbm");
	if (crm_gcjddjjl_gcjdbm!=null)
	{
		crm_gcjddjjl_gcjdbm=cf.GB2Uni(crm_gcjddjjl_gcjdbm);
		if (!(crm_gcjddjjl_gcjdbm.equals("")))	wheresql+=" and  (crm_gcjddjjl.gcjdbm='"+crm_gcjddjjl_gcjdbm+"')";
	}
	crm_gcjddjjl_djsj=request.getParameter("crm_gcjddjjl_djsj");
	if (crm_gcjddjjl_djsj!=null)
	{
		crm_gcjddjjl_djsj=crm_gcjddjjl_djsj.trim();
		if (!(crm_gcjddjjl_djsj.equals("")))	wheresql+="  and (crm_gcjddjjl.djsj>=TO_DATE('"+crm_gcjddjjl_djsj+"','YYYY/MM/DD'))";
	}
	crm_gcjddjjl_djsj=request.getParameter("crm_gcjddjjl_djsj2");
	if (crm_gcjddjjl_djsj!=null)
	{
		crm_gcjddjjl_djsj=crm_gcjddjjl_djsj.trim();
		if (!(crm_gcjddjjl_djsj.equals("")))	wheresql+="  and (crm_gcjddjjl.djsj<=TO_DATE('"+crm_gcjddjjl_djsj+"','YYYY/MM/DD'))";
	}
	crm_gcjddjjl_lrr=request.getParameter("crm_gcjddjjl_lrr");
	if (crm_gcjddjjl_lrr!=null)
	{
		crm_gcjddjjl_lrr=cf.GB2Uni(crm_gcjddjjl_lrr);
		if (!(crm_gcjddjjl_lrr.equals("")))	wheresql+=" and  (crm_gcjddjjl.lrr='"+crm_gcjddjjl_lrr+"')";
	}
	crm_gcjddjjl_lrsj=request.getParameter("crm_gcjddjjl_lrsj");
	if (crm_gcjddjjl_lrsj!=null)
	{
		crm_gcjddjjl_lrsj=crm_gcjddjjl_lrsj.trim();
		if (!(crm_gcjddjjl_lrsj.equals("")))	wheresql+="  and (crm_gcjddjjl.lrsj>=TO_DATE('"+crm_gcjddjjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_gcjddjjl_lrsj=request.getParameter("crm_gcjddjjl_lrsj2");
	if (crm_gcjddjjl_lrsj!=null)
	{
		crm_gcjddjjl_lrsj=crm_gcjddjjl_lrsj.trim();
		if (!(crm_gcjddjjl_lrsj.equals("")))	wheresql+="  and (crm_gcjddjjl.lrsj<=TO_DATE('"+crm_gcjddjjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	ls_sql="SELECT crm_gcjddjjl.djjlh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_gcjddjjl.zpsl,dm_gcjdbm.ysgcjdmc,crm_gcjddjjl.djsj,crm_khxx.jhybgcrq,crm_khxx.jhzqsj,DECODE(crm_gcjddjjl.sfszhf,'1','����','0','������'),crm_gcjddjjl.hfszjlh,sgdmc,crm_khxx.sgbz,crm_khxx.zjxm,crm_khxx.sjs ,crm_khxx.qyrq,crm_gcjddjjl.khbh,crm_gcjddjjl.lrr,crm_gcjddjjl.lrsj,sq_dwxx.dwmc,crm_gcjddjjl.bz ";
	ls_sql+=" FROM crm_gcjddjjl,crm_khxx,dm_gcjdbm,sq_dwxx,sq_sgd  ";
    ls_sql+=" where crm_gcjddjjl.gcjdbm=dm_gcjdbm.gcjdbm and crm_gcjddjjl.lrdw=sq_dwxx.dwbh and crm_gcjddjjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
 
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_gcjddjjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_gcjddjjlList.jsp","SelectCrm_gcjddjjl.jsp","","EditCrm_gcjddjjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"djjlh","crm_gcjddjjl_khbh","dm_gcjdbm_ysgcjdmc","crm_gcjddjjl_djsj","crm_gcjddjjl_lrr","crm_gcjddjjl_lrsj","sq_dwxx_dwmc","crm_gcjddjjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","crm_khxx_sjs"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"djjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCrm_gcjddjjl.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
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
  <B><font size="3">�����Ǽǣ���ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">�ǼǼ�¼��</td>
	<td  width="4%">��ͬ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="3%">��Ƭ��</td>
	<td  width="3%">���̽���</td>
	<td  width="4%">ʵ�ʿ���ʱ��</td>
	<td  width="4%">�ƻ����ι�����������</td>
	<td  width="4%">�ƻ���������ʱ��</td>
	<td  width="3%">�Ƿ����ûط�</td>
	<td  width="4%">�ط����ü�¼��</td>

	<td  width="3%">ʩ����</td>
	<td  width="3%">�೤</td>
	<td  width="3%">����</td>
	<td  width="3%">���ʦ</td>
	<td  width="4%">ǩԼ����</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="6%">¼�뵥λ</td>
	<td  width="15%">��ע</td>
</tr>
<%
	pageObj.displayDate();
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