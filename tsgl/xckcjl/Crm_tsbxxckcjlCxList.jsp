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
	String crm_tsbxxckcjl_tsjlh=null;
	String crm_tsjl_slfsbm=null;
	String crm_tsjl_yzcdbm=null;
	String crm_tsjl_slsj=null;
	String crm_tsjl_slr=null;
	String crm_tsjl_clzt=null;
	String crm_tsjl_jasj=null;
	String crm_tsbxxckcjl_kcjlh=null;
	String crm_tsbxxckcjl_kcr=null;
	String crm_tsbxxckcjl_kcsj=null;
	String crm_tsbxxckcjl_lrr=null;
	String crm_tsbxxckcjl_lrsj=null;
	String crm_tsjl_lx=null;

	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

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

	


	crm_tsbxxckcjl_tsjlh=request.getParameter("crm_tsbxxckcjl_tsjlh");
	if (crm_tsbxxckcjl_tsjlh!=null)
	{
		crm_tsbxxckcjl_tsjlh=cf.GB2Uni(crm_tsbxxckcjl_tsjlh);
		if (!(crm_tsbxxckcjl_tsjlh.equals("")))	wheresql+=" and  (crm_tsbxxckcjl.tsjlh='"+crm_tsbxxckcjl_tsjlh+"')";
	}
	crm_tsjl_slfsbm=request.getParameter("crm_tsjl_slfsbm");
	if (crm_tsjl_slfsbm!=null)
	{
		crm_tsjl_slfsbm=cf.GB2Uni(crm_tsjl_slfsbm);
		if (!(crm_tsjl_slfsbm.equals("")))	wheresql+=" and  (crm_tsjl.slfsbm='"+crm_tsjl_slfsbm+"')";
	}
	crm_tsjl_yzcdbm=request.getParameter("crm_tsjl_yzcdbm");
	if (crm_tsjl_yzcdbm!=null)
	{
		crm_tsjl_yzcdbm=cf.GB2Uni(crm_tsjl_yzcdbm);
		if (!(crm_tsjl_yzcdbm.equals("")))	wheresql+=" and  (crm_tsjl.yzcdbm='"+crm_tsjl_yzcdbm+"')";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj2");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slr=request.getParameter("crm_tsjl_slr");
	if (crm_tsjl_slr!=null)
	{
		crm_tsjl_slr=cf.GB2Uni(crm_tsjl_slr);
		if (!(crm_tsjl_slr.equals("")))	wheresql+=" and  (crm_tsjl.slr='"+crm_tsjl_slr+"')";
	}
	crm_tsjl_clzt=request.getParameter("crm_tsjl_clzt");
	if (crm_tsjl_clzt!=null)
	{
		crm_tsjl_clzt=cf.GB2Uni(crm_tsjl_clzt);
		if (!(crm_tsjl_clzt.equals("")))	wheresql+=" and  (crm_tsjl.clzt='"+crm_tsjl_clzt+"')";
	}
	crm_tsjl_jasj=request.getParameter("crm_tsjl_jasj");
	if (crm_tsjl_jasj!=null)
	{
		crm_tsjl_jasj=crm_tsjl_jasj.trim();
		if (!(crm_tsjl_jasj.equals("")))	wheresql+="  and (crm_tsjl.jasj>=TO_DATE('"+crm_tsjl_jasj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_jasj=request.getParameter("crm_tsjl_jasj2");
	if (crm_tsjl_jasj!=null)
	{
		crm_tsjl_jasj=crm_tsjl_jasj.trim();
		if (!(crm_tsjl_jasj.equals("")))	wheresql+="  and (crm_tsjl.jasj<=TO_DATE('"+crm_tsjl_jasj+"','YYYY/MM/DD'))";
	}
	crm_tsbxxckcjl_kcjlh=request.getParameter("crm_tsbxxckcjl_kcjlh");
	if (crm_tsbxxckcjl_kcjlh!=null)
	{
		crm_tsbxxckcjl_kcjlh=cf.GB2Uni(crm_tsbxxckcjl_kcjlh);
		if (!(crm_tsbxxckcjl_kcjlh.equals("")))	wheresql+=" and  (crm_tsbxxckcjl.kcjlh='"+crm_tsbxxckcjl_kcjlh+"')";
	}
	crm_tsbxxckcjl_kcr=request.getParameter("crm_tsbxxckcjl_kcr");
	if (crm_tsbxxckcjl_kcr!=null)
	{
		crm_tsbxxckcjl_kcr=cf.GB2Uni(crm_tsbxxckcjl_kcr);
		if (!(crm_tsbxxckcjl_kcr.equals("")))	wheresql+=" and  (crm_tsbxxckcjl.kcr='"+crm_tsbxxckcjl_kcr+"')";
	}
	crm_tsbxxckcjl_kcsj=request.getParameter("crm_tsbxxckcjl_kcsj");
	if (crm_tsbxxckcjl_kcsj!=null)
	{
		crm_tsbxxckcjl_kcsj=crm_tsbxxckcjl_kcsj.trim();
		if (!(crm_tsbxxckcjl_kcsj.equals("")))	wheresql+="  and (crm_tsbxxckcjl.kcsj>=TO_DATE('"+crm_tsbxxckcjl_kcsj+"','YYYY/MM/DD'))";
	}
	crm_tsbxxckcjl_kcsj=request.getParameter("crm_tsbxxckcjl_kcsj2");
	if (crm_tsbxxckcjl_kcsj!=null)
	{
		crm_tsbxxckcjl_kcsj=crm_tsbxxckcjl_kcsj.trim();
		if (!(crm_tsbxxckcjl_kcsj.equals("")))	wheresql+="  and (crm_tsbxxckcjl.kcsj<=TO_DATE('"+crm_tsbxxckcjl_kcsj+"','YYYY/MM/DD'))";
	}
	crm_tsbxxckcjl_lrr=request.getParameter("crm_tsbxxckcjl_lrr");
	if (crm_tsbxxckcjl_lrr!=null)
	{
		crm_tsbxxckcjl_lrr=cf.GB2Uni(crm_tsbxxckcjl_lrr);
		if (!(crm_tsbxxckcjl_lrr.equals("")))	wheresql+=" and  (crm_tsbxxckcjl.lrr='"+crm_tsbxxckcjl_lrr+"')";
	}
	crm_tsbxxckcjl_lrsj=request.getParameter("crm_tsbxxckcjl_lrsj");
	if (crm_tsbxxckcjl_lrsj!=null)
	{
		crm_tsbxxckcjl_lrsj=crm_tsbxxckcjl_lrsj.trim();
		if (!(crm_tsbxxckcjl_lrsj.equals("")))	wheresql+="  and (crm_tsbxxckcjl.lrsj>=TO_DATE('"+crm_tsbxxckcjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tsbxxckcjl_lrsj=request.getParameter("crm_tsbxxckcjl_lrsj2");
	if (crm_tsbxxckcjl_lrsj!=null)
	{
		crm_tsbxxckcjl_lrsj=crm_tsbxxckcjl_lrsj.trim();
		if (!(crm_tsbxxckcjl_lrsj.equals("")))	wheresql+="  and (crm_tsbxxckcjl.lrsj<=TO_DATE('"+crm_tsbxxckcjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_lx=request.getParameter("crm_tsjl_lx");
	if (crm_tsjl_lx!=null)
	{
		crm_tsjl_lx=cf.GB2Uni(crm_tsjl_lx);
		if (!(crm_tsjl_lx.equals("")))	wheresql+=" and  (crm_tsjl.lx='"+crm_tsjl_lx+"')";
	}

	ls_sql="SELECT crm_tsbxxckcjl.kcjlh,crm_khxx.khxm,crm_tsbxxckcjl.xcqk,crm_tsbxxckcjl.xcclqk,crm_tsbxxckcjl.kcr,crm_tsbxxckcjl.kcsj,crm_tsbxxckcjl.lrr,crm_tsbxxckcjl.lrsj,dwmc,crm_tsbxxckcjl.bz,crm_khxx.fwdz,crm_khxx.lxfs,crm_tsbxxckcjl.tsjlh,crm_tsjl.tsnr,crm_tsjl.slsj,crm_tsjl.slr, DECODE(crm_tsjl.clzt,'0','δ����','1','������','4','�ѽ���','5','�ѳ��ֳ�','6','�ѳ�����','7','�������ͨ��','2','�ڴ���','3','�᰸','9','������'),crm_khxx.khbh  ";
	ls_sql+=" FROM crm_khxx,crm_tsbxxckcjl,crm_tsjl,sq_dwxx  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsbxxckcjl.tsjlh=crm_tsjl.tsjlh and crm_tsbxxckcjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_tsbxxckcjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_tsbxxckcjlCxList.jsp","SelectCxCrm_tsbxxckcjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"crm_khxx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_tsbxxckcjl_tsjlh","crm_tsjl_tsnr","crm_tsjl_slsj","crm_tsjl_slr","crm_tsjl_clzt","kcjlh","crm_tsbxxckcjl_xcqk","crm_tsbxxckcjl_xcclqk","crm_tsbxxckcjl_kcr","crm_tsbxxckcjl_kcsj","crm_tsbxxckcjl_lrr","crm_tsbxxckcjl_lrsj","crm_tsbxxckcjl_lrbm","crm_tsbxxckcjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kcjlh"};
	pageObj.setKey(keyName);

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

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�����¼��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="12%">�ֳ����</td>
	<td  width="12%">�ֳ��������</td>
	<td  width="3%">������</td>
	<td  width="4%">����ʱ��</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="5%">��ע</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="7%">��ϵ��ʽ</td>
	<td  width="4%">Ͷ�߱��޼�¼��</td>
	<td  width="11%">Ͷ�߱�������</td>
	<td  width="4%">�ͷ�����ʱ��</td>
	<td  width="3%">�ͷ�������</td>
	<td  width="4%">�᰸״̬</td>
	<td  width="3%">�ͻ����</td>
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