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
	String cw_gdjkjl_gdjkjlh=null;
	String cw_gdjkjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_sgbz=null;
	String crm_khxx_zjxm=null;
	String cw_gdjkjl_jklx=null;
	String cw_gdjkjl_jkje=null;
	String cw_gdjkjl_jkblr=null;
	String cw_gdjkjl_jkblsj=null;
	String cw_gdjkjl_lrr=null;
	String cw_gdjkjl_lrsj=null;
	String cw_gdjkjl_lrbm=null;
	String cw_gdjkjl_gdjsjd=null;
	String cw_gdjkjl_gdjsjlh=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";


	String scbz=null;
	scbz=request.getParameter("scbz");
	if (scbz!=null)
	{
		if (!(scbz.equals("")))	wheresql+=" and  (cw_gdjkjl.scbz='"+scbz+"')";
	}

	String czlx=null;
	czlx=request.getParameter("czlx");
	if (czlx!=null)
	{
		if (!(czlx.equals("")))	wheresql+=" and  (cw_gdjkjl.czlx='"+czlx+"')";
	}


	cw_gdjkjl_gdjkjlh=request.getParameter("cw_gdjkjl_gdjkjlh");
	if (cw_gdjkjl_gdjkjlh!=null)
	{
		cw_gdjkjl_gdjkjlh=cf.GB2Uni(cw_gdjkjl_gdjkjlh);
		if (!(cw_gdjkjl_gdjkjlh.equals("")))	wheresql+=" and  (cw_gdjkjl.gdjkjlh='"+cw_gdjkjl_gdjkjlh+"')";
	}
	cw_gdjkjl_khbh=request.getParameter("cw_gdjkjl_khbh");
	if (cw_gdjkjl_khbh!=null)
	{
		cw_gdjkjl_khbh=cf.GB2Uni(cw_gdjkjl_khbh);
		if (!(cw_gdjkjl_khbh.equals("")))	wheresql+=" and  (cw_gdjkjl.khbh='"+cw_gdjkjl_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye="+crm_khxx_qye+") ";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (cw_gdjkjl.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_sgbz=request.getParameter("crm_khxx_sgbz");
	if (crm_khxx_sgbz!=null)
	{
		crm_khxx_sgbz=cf.GB2Uni(crm_khxx_sgbz);
		if (!(crm_khxx_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_khxx_sgbz+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	cw_gdjkjl_jklx=request.getParameter("cw_gdjkjl_jklx");
	if (cw_gdjkjl_jklx!=null)
	{
		cw_gdjkjl_jklx=cf.GB2Uni(cw_gdjkjl_jklx);
		if (!(cw_gdjkjl_jklx.equals("")))	wheresql+=" and  (cw_gdjkjl.jklx='"+cw_gdjkjl_jklx+"')";
	}
	cw_gdjkjl_jkje=request.getParameter("cw_gdjkjl_jkje");
	if (cw_gdjkjl_jkje!=null)
	{
		cw_gdjkjl_jkje=cw_gdjkjl_jkje.trim();
		if (!(cw_gdjkjl_jkje.equals("")))	wheresql+=" and  (cw_gdjkjl.jkje="+cw_gdjkjl_jkje+") ";
	}
	cw_gdjkjl_jkblr=request.getParameter("cw_gdjkjl_jkblr");
	if (cw_gdjkjl_jkblr!=null)
	{
		cw_gdjkjl_jkblr=cf.GB2Uni(cw_gdjkjl_jkblr);
		if (!(cw_gdjkjl_jkblr.equals("")))	wheresql+=" and  (cw_gdjkjl.jkblr='"+cw_gdjkjl_jkblr+"')";
	}
	cw_gdjkjl_jkblsj=request.getParameter("cw_gdjkjl_jkblsj");
	if (cw_gdjkjl_jkblsj!=null)
	{
		cw_gdjkjl_jkblsj=cw_gdjkjl_jkblsj.trim();
		if (!(cw_gdjkjl_jkblsj.equals("")))	wheresql+="  and (cw_gdjkjl.jkblsj=TO_DATE('"+cw_gdjkjl_jkblsj+"','YYYY/MM/DD'))";
	}
	cw_gdjkjl_lrr=request.getParameter("cw_gdjkjl_lrr");
	if (cw_gdjkjl_lrr!=null)
	{
		cw_gdjkjl_lrr=cf.GB2Uni(cw_gdjkjl_lrr);
		if (!(cw_gdjkjl_lrr.equals("")))	wheresql+=" and  (cw_gdjkjl.lrr='"+cw_gdjkjl_lrr+"')";
	}
	cw_gdjkjl_lrsj=request.getParameter("cw_gdjkjl_lrsj");
	if (cw_gdjkjl_lrsj!=null)
	{
		cw_gdjkjl_lrsj=cw_gdjkjl_lrsj.trim();
		if (!(cw_gdjkjl_lrsj.equals("")))	wheresql+="  and (cw_gdjkjl.lrsj=TO_DATE('"+cw_gdjkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_gdjkjl_lrbm=request.getParameter("cw_gdjkjl_lrbm");
	if (cw_gdjkjl_lrbm!=null)
	{
		cw_gdjkjl_lrbm=cf.GB2Uni(cw_gdjkjl_lrbm);
		if (!(cw_gdjkjl_lrbm.equals("")))	wheresql+=" and  (cw_gdjkjl.lrbm='"+cw_gdjkjl_lrbm+"')";
	}
	cw_gdjkjl_gdjsjd=request.getParameter("cw_gdjkjl_gdjsjd");
	if (cw_gdjkjl_gdjsjd!=null)
	{
		cw_gdjkjl_gdjsjd=cf.GB2Uni(cw_gdjkjl_gdjsjd);
		if (!(cw_gdjkjl_gdjsjd.equals("")))	wheresql+=" and  (cw_gdjkjl.gdjsjd='"+cw_gdjkjl_gdjsjd+"')";
	}
	cw_gdjkjl_gdjsjlh=request.getParameter("cw_gdjkjl_gdjsjlh");
	if (cw_gdjkjl_gdjsjlh!=null)
	{
		cw_gdjkjl_gdjsjlh=cf.GB2Uni(cw_gdjkjl_gdjsjlh);
		if (!(cw_gdjkjl_gdjsjlh.equals("")))	wheresql+=" and  (cw_gdjkjl.gdjsjlh='"+cw_gdjkjl_gdjsjlh+"')";
	}
	ls_sql="SELECT sgdmc,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,cw_gdjkjl.gdjkjlh,DECODE(cw_gdjkjl.scbz,'N','δɾ��','Y','ɾ��') scbz,DECODE(cw_gdjkjl.czlx,'1','¼��','2','����','3','����') czlx,DECODE(cw_gdjkjl.jklx,'1','�����','2','���Ͽ�','3','���ڲ���','9','����') as cw_gdjkjl_jklx,cw_gdjkjl.jkje,cw_gdjkjl.jkblr,cw_gdjkjl.jkblsj as cw_gdjkjl_jkblsj,cw_gdjkjl.lrr,cw_gdjkjl.lrsj,dwmc,DECODE(cw_gdjkjl.gdjsjd,'0','δ����','1','����') gdjsjd,cw_gdjkjl.gdjsjlh,cw_gdjkjl.bz  ";
	ls_sql+=" FROM crm_khxx,cw_gdjkjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjkjl.khbh=crm_khxx.khbh(+) and cw_gdjkjl.sgd=sq_sgd.sgd(+) and cw_gdjkjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_gdjkjl.sgd,cw_gdjkjl.scbz,cw_gdjkjl.czlx,cw_gdjkjl.khbh,cw_gdjkjl.gdjkjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_gdjkjlCxList.jsp","SelectCxCw_gdjkjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgdmc","1");//�в����������Hash��
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("sjs","1");//�в����������Hash��
	spanColHash.put("zjxm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">ʩ����</td>
	<td  width="4%">��ͬ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">�ʼ�</td>
	<td  width="4%">����¼��</td>
	<td  width="3%">ɾ����־</td>
	<td  width="3%">��������</td>
	<td  width="4%">�������</td>
	<td  width="5%">�����</td>
	<td  width="3%">������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="3%">�����־</td>
	<td  width="5%">�����¼��</td>
	<td  width="18%">��ע</td>
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