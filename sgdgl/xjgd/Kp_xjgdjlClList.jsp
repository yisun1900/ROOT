<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String zwbm=(String)session.getAttribute("zwbm");
String sjsbh=(String)session.getAttribute("sjsbh");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";



	if (zwbm.equals("31"))//�������ܣ�ֻ�ܿ���С�鹤��
	{
		wheresql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where sjsbh='"+sjsbh+"' and zwbm in('05','31') and sfzszg in('Y','N'))";
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
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}
	String sgdmc=null;
	sgdmc=request.getParameter("sgdmc");
	if (sgdmc!=null)
	{
		sgdmc=cf.GB2Uni(sgdmc);
		if (!(sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sgdmc+"')";
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







	String kp_xjgdjl_xjjlh=null;
	String kp_xjgdjl_khbh=null;
	String kp_xjgdjl_xjr=null;
	String kp_xjgdjl_xjsj=null;
	String xjlxbm=null;
	String kp_xjgdjl_lrr=null;
	String kp_xjgdjl_lrsj=null;



	String xjjgbm=null;
	xjjgbm=request.getParameter("xjjgbm");
	if (xjjgbm!=null)
	{
		if (!(xjjgbm.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjgbm='"+xjjgbm+"')";
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
		if (!(kp_xjgdjl_lrsj.equals("")))	wheresql+="  and (kp_xjgdjl.lrsj<=TO_DATE('"+kp_xjgdjl_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String fkbm=null;
	fkbm=request.getParameter("fkbm");
	if (fkbm!=null)
	{
		fkbm=cf.GB2Uni(fkbm);
		if (!(fkbm.equals("")))	wheresql+=" and  (kp_zggdmx.fkbm='"+fkbm+"')";
	}
	String fkbmjsr=null;
	fkbmjsr=request.getParameter("fkbmjsr");
	if (fkbmjsr!=null)
	{
		fkbmjsr=cf.GB2Uni(fkbmjsr);
		if (!(fkbmjsr.equals("")))	wheresql+=" and  (kp_zggdmx.fkbmjsr='"+fkbmjsr+"')";
	}

	ls_sql="SELECT zgjlh,decode(kp_zggdmx.clzt,'1','δ����','2','�ѽ���','3','�ڴ���','4','�ѽ��','5','����ͨ��','6','����δͨ��')  clzt,kp_xjgdjl.xjjlh,kp_zggdmx.yqjjsj,kp_zggdmx.zgcljlh,kp_zggdmx.jsr,kp_zggdmx.jssj,sgdmc,crm_khxx.khxm,crm_khxx.fwdz,kp_zggdmx.jssm,kp_zggdmx.zgxm,dwmc,kp_zggdmx.fkbmjsr,crm_khxx.sjs,crm_khxx.zjxm,kp_zggdmx.zgsm,xjlxmc,xjjgmc,crm_khxx.khbh";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd,kp_xjlxbm,dm_xjjgbm,kp_zggdmx,sq_dwxx  ";
    ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+) ";
    ls_sql+=" and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm(+) ";
    ls_sql+=" and kp_xjgdjl.xjjlh=kp_zggdmx.xjjlh(+) ";
    ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh(+) ";
    ls_sql+=" and kp_zggdmx.fkbm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and kp_zggdmx.clzt in ('2','3') ";//1:δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
    ls_sql+=" and kp_xjgdjl.wtclbz in('N','C')  ";//B�������ģ�N������δ���գ�C���ڴ���Y���ѽ��
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by kp_zggdmx.jssj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_xjgdjlClList.jsp","","","ClKp_xjgdjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("����");
/*
//������ʾ��
	String[] disColName={"xjjlh","kp_xjgdjl_khbh","kp_xjgdjl_xjr","kp_xjgdjl_xjsj","xjlxbm","dm_xjjgbm_xjjgmc","kp_xjgdjl_lrr","kp_xjgdjl_lrsj","kp_xjgdjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zgjlh"};
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
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">�������⣭����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">���ļ�¼��</td>
	<td  width="3%">���Ĵ���״̬</td>
	<td  width="4%">����¼��</td>
	<td  width="4%">Ҫ����ʱ��</td>
	<td  width="4%">���Ĵ����¼��</td>
	<td  width="3%">������</td>
	<td  width="4%">����ʱ��</td>
	<td  width="3%">ʩ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="12%">����˵��</td>
	<td  width="9%">������Ŀ</td>
	<td  width="5%">��������</td>
	<td  width="3%">�������Ž�����</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">�ʼ�</td>
	<td  width="10%">����˵��</td>
	<td  width="5%">�������</td>
	<td  width="3%">�����</td>
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