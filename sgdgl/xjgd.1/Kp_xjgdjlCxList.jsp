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
	String kp_xjgdjl_xjjlh=null;
	String kp_xjgdjl_khbh=null;
	String kp_xjgdjl_xjr=null;
	String kp_xjgdjl_xjsj=null;
	String xjlxbm=null;
	String kp_xjgdjl_lrr=null;
	String kp_xjgdjl_lrsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;


	String xjjgbm=null;
	xjjgbm=request.getParameter("xjjgbm");
	if (xjjgbm!=null)
	{
		if (!(xjjgbm.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjgbm='"+xjjgbm+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String lrdw=null;
	lrdw=request.getParameter("lrdw");
	if (lrdw!=null)
	{
		if (!(lrdw.equals("")))	wheresql+=" and  (kp_xjgdjl.lrdw='"+lrdw+"')";
	}


	String cfspbz=null;
	cfspbz=request.getParameter("cfspbz");
	if (cfspbz!=null)
	{
		if (!(cfspbz.equals("")))	wheresql+=" and  (kp_xjgdjl.cfspbz='"+cfspbz+"')";
	}
	String kpbz=null;
	kpbz=request.getParameter("kpbz");
	if (kpbz!=null)
	{
		if (!(kpbz.equals("")))	wheresql+=" and  (kp_xjgdjl.kpbz='"+kpbz+"')";
	}
	String kpjlh=null;
	kpjlh=request.getParameter("kpjlh");
	if (kpjlh!=null)
	{
		if (!(kpjlh.equals("")))	wheresql+=" and  (kp_xjgdjl.kpjlh='"+kpjlh+"')";
	}
	String jsbz=null;
	jsbz=request.getParameter("jsbz");
	if (jsbz!=null)
	{
		if (!(jsbz.equals("")))	wheresql+=" and  (kp_xjgdjl.jsbz='"+jsbz+"')";
	}
	String jsjlh=null;
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		if (!(jsjlh.equals("")))	wheresql+=" and  (kp_xjgdjl.jsjlh='"+jsjlh+"')";
	}

	kp_xjgdjl_xjjlh=request.getParameter("kp_xjgdjl_xjjlh");
	if (kp_xjgdjl_xjjlh!=null)
	{
		kp_xjgdjl_xjjlh=cf.GB2Uni(kp_xjgdjl_xjjlh);
		if (!(kp_xjgdjl_xjjlh.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjlh='"+kp_xjgdjl_xjjlh+"')";
	}
	kp_xjgdjl_khbh=request.getParameter("kp_xjgdjl_khbh");
	if (kp_xjgdjl_khbh!=null)
	{
		kp_xjgdjl_khbh=cf.GB2Uni(kp_xjgdjl_khbh);
		if (!(kp_xjgdjl_khbh.equals("")))	wheresql+=" and  (kp_xjgdjl.khbh='"+kp_xjgdjl_khbh+"')";
	}
	kp_xjgdjl_xjr=request.getParameter("kp_xjgdjl_xjr");
	if (kp_xjgdjl_xjr!=null)
	{
		kp_xjgdjl_xjr=cf.GB2Uni(kp_xjgdjl_xjr);
		if (!(kp_xjgdjl_xjr.equals("")))	wheresql+=" and  (kp_xjgdjl.xjr='"+kp_xjgdjl_xjr+"')";
	}
	kp_xjgdjl_xjsj=request.getParameter("kp_xjgdjl_xjsj");
	if (kp_xjgdjl_xjsj!=null)
	{
		kp_xjgdjl_xjsj=kp_xjgdjl_xjsj.trim();
		if (!(kp_xjgdjl_xjsj.equals("")))	wheresql+="  and (kp_xjgdjl.xjsj>=TO_DATE('"+kp_xjgdjl_xjsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjl_xjsj=request.getParameter("kp_xjgdjl_xjsj2");
	if (kp_xjgdjl_xjsj!=null)
	{
		kp_xjgdjl_xjsj=kp_xjgdjl_xjsj.trim();
		if (!(kp_xjgdjl_xjsj.equals("")))	wheresql+="  and (kp_xjgdjl.xjsj<=TO_DATE('"+kp_xjgdjl_xjsj+"','YYYY/MM/DD'))";
	}
	xjlxbm=request.getParameter("xjlxbm");
	if (xjlxbm!=null)
	{
		xjlxbm=cf.GB2Uni(xjlxbm);
		if (!(xjlxbm.equals("")))	wheresql+=" and  (kp_xjgdjl.xjlxbm='"+xjlxbm+"')";
	}
	kp_xjgdjl_lrr=request.getParameter("kp_xjgdjl_lrr");
	if (kp_xjgdjl_lrr!=null)
	{
		kp_xjgdjl_lrr=cf.GB2Uni(kp_xjgdjl_lrr);
		if (!(kp_xjgdjl_lrr.equals("")))	wheresql+=" and  (kp_xjgdjl.lrr='"+kp_xjgdjl_lrr+"')";
	}
	kp_xjgdjl_lrsj=request.getParameter("kp_xjgdjl_lrsj");
	if (kp_xjgdjl_lrsj!=null)
	{
		kp_xjgdjl_lrsj=kp_xjgdjl_lrsj.trim();
		if (!(kp_xjgdjl_lrsj.equals("")))	wheresql+="  and (kp_xjgdjl.lrsj>=TO_DATE('"+kp_xjgdjl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjl_lrsj=request.getParameter("kp_xjgdjl_lrsj2");
	if (kp_xjgdjl_lrsj!=null)
	{
		kp_xjgdjl_lrsj=kp_xjgdjl_lrsj.trim();
		if (!(kp_xjgdjl_lrsj.equals("")))	wheresql+="  and (kp_xjgdjl.lrsj<=TO_DATE('"+kp_xjgdjl_lrsj+"','YYYY/MM/DD'))";
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
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (kp_xjgdjl.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");
	
	ls_sql="SELECT kp_xjgdjl.xjjlh,DECODE(cfspbz,'1','��������','2','δ����','3','����ͨ��','4','����δͨ��'),DECODE(kp_xjgdjl.kpbz,'N','δ����','Y','�ѿ���'),DECODE(kp_xjgdjl.jsbz,'N','δ����','Y','�ѽ���'),sgdmc,fkze,kfzs,jlje,kp_xjgdjl.kcjdebl||'%',crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,kp_xjgdjl.xjr,kp_xjgdjl.xjsj,xjlxmc,xjjgmc,xjwtflmc,kp_xjgdjl.bz,crm_khxx.sjs,crm_khxx.zjxm,kp_xjgdjl.lrr,kp_xjgdjl.lrsj,dwmc  ";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd,kp_xjlxbm,dm_xjjgbm,sq_dwxx,dm_xjwtflbm  ";
    ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+)";
    ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm";
	ls_sql+=" and kp_xjgdjl.xjwtflbm=dm_xjwtflbm.xjwtflbm(+)";
	ls_sql+=" and kp_xjgdjl.lrdw=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by kp_xjgdjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_xjgdjlCxList.jsp","SelectCxKp_xjgdjl.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"xjjlh","kp_xjgdjl_khbh","kp_xjgdjl_xjr","kp_xjgdjl_xjsj","xjlxbm","dm_xjjgbm_xjjgmc","kp_xjgdjl_lrr","kp_xjgdjl_lrsj","kp_xjgdjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xjjlh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"xjjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_xjgdjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xjjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
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
  <B><font size="3">ʩ���Ӽ���¼--��ѯ����������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">����¼��</td>
	<td  width="3%">������־</td>
	<td  width="3%">������־</td>
	<td  width="3%">�����־</td>
	<td  width="3%">ʩ����</td>
	<td  width="4%">�����ܶ�</td>
	<td  width="4%">�۷�����</td>
	<td  width="4%">�������</td>
	<td  width="3%">�۳��ӵ���ٷֱ�</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="3%">�����</td>
	<td  width="4%">���ʱ��</td>
	<td  width="5%">�������</td>
	<td  width="3%">�����</td>
	<td  width="6%">�������</td>
	<td  width="13%">������˵��</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">�ʼ�</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
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