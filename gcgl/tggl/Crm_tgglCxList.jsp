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
	String gj=null;
	gj=request.getParameter("gj");
	if (gj!=null)
	{
		gj=cf.GB2Uni(gj);
		if (!(gj.equals("")))	wheresql+=" and  (crm_khxx.gj='"+gj+"')";
	}
	String dd=null;
	dd=request.getParameter("dd");
	if (dd!=null)
	{
		dd=cf.GB2Uni(dd);
		if (!(dd.equals("")))	wheresql+=" and  (crm_khxx.dd='"+dd+"')";
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
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	
	String crm_tggl_djbh=null;
	String crm_tggl_tgsqr=null;
	String crm_tggl_tgsqsj=null;
	String crm_tggl_tgshr=null;
	String crm_tggl_tgshsj=null;
	String crm_tggl_tgshjg=null;
	String crm_tggl_tgyybm=null;
	String crm_tggl_tgkssj=null;
	String crm_tggl_gjfgsj=null;
	String crm_tggl_tglrr=null;
	String crm_tggl_tglrsj=null;
	String crm_tggl_sjfgsj=null;
	String crm_tggl_fglrr=null;
	String crm_tggl_fglrsj=null;
	String crm_tggl_zt=null;
	String crm_tggl_lrr=null;
	String crm_tggl_lrsj=null;
	String crm_tggl_lrbm=null;
	crm_tggl_djbh=request.getParameter("crm_tggl_djbh");
	if (crm_tggl_djbh!=null)
	{
		crm_tggl_djbh=cf.GB2Uni(crm_tggl_djbh);
		if (!(crm_tggl_djbh.equals("")))	wheresql+=" and  (crm_tggl.djbh='"+crm_tggl_djbh+"')";
	}
	crm_tggl_tgsqr=request.getParameter("crm_tggl_tgsqr");
	if (crm_tggl_tgsqr!=null)
	{
		crm_tggl_tgsqr=cf.GB2Uni(crm_tggl_tgsqr);
		if (!(crm_tggl_tgsqr.equals("")))	wheresql+=" and  (crm_tggl.tgsqr='"+crm_tggl_tgsqr+"')";
	}
	crm_tggl_tgsqsj=request.getParameter("crm_tggl_tgsqsj");
	if (crm_tggl_tgsqsj!=null)
	{
		crm_tggl_tgsqsj=crm_tggl_tgsqsj.trim();
		if (!(crm_tggl_tgsqsj.equals("")))	wheresql+="  and (crm_tggl.tgsqsj=TO_DATE('"+crm_tggl_tgsqsj+"','YYYY/MM/DD'))";
	}
	crm_tggl_tgshr=request.getParameter("crm_tggl_tgshr");
	if (crm_tggl_tgshr!=null)
	{
		crm_tggl_tgshr=cf.GB2Uni(crm_tggl_tgshr);
		if (!(crm_tggl_tgshr.equals("")))	wheresql+=" and  (crm_tggl.tgshr='"+crm_tggl_tgshr+"')";
	}
	crm_tggl_tgshsj=request.getParameter("crm_tggl_tgshsj");
	if (crm_tggl_tgshsj!=null)
	{
		crm_tggl_tgshsj=crm_tggl_tgshsj.trim();
		if (!(crm_tggl_tgshsj.equals("")))	wheresql+="  and (crm_tggl.tgshsj=TO_DATE('"+crm_tggl_tgshsj+"','YYYY/MM/DD'))";
	}
	crm_tggl_tgshjg=request.getParameter("crm_tggl_tgshjg");
	if (crm_tggl_tgshjg!=null)
	{
		crm_tggl_tgshjg=cf.GB2Uni(crm_tggl_tgshjg);
		if (!(crm_tggl_tgshjg.equals("")))	wheresql+=" and  (crm_tggl.tgshjg='"+crm_tggl_tgshjg+"')";
	}
	crm_tggl_tgyybm=request.getParameter("crm_tggl_tgyybm");
	if (crm_tggl_tgyybm!=null)
	{
		crm_tggl_tgyybm=cf.GB2Uni(crm_tggl_tgyybm);
		if (!(crm_tggl_tgyybm.equals("")))	wheresql+=" and  (crm_tggl.tgyybm='"+crm_tggl_tgyybm+"')";
	}
	crm_tggl_tgkssj=request.getParameter("crm_tggl_tgkssj");
	if (crm_tggl_tgkssj!=null)
	{
		crm_tggl_tgkssj=crm_tggl_tgkssj.trim();
		if (!(crm_tggl_tgkssj.equals("")))	wheresql+="  and (crm_tggl.tgkssj>=TO_DATE('"+crm_tggl_tgkssj+"','YYYY/MM/DD'))";
	}
	crm_tggl_tgkssj=request.getParameter("crm_tggl_tgkssj2");
	if (crm_tggl_tgkssj!=null)
	{
		crm_tggl_tgkssj=crm_tggl_tgkssj.trim();
		if (!(crm_tggl_tgkssj.equals("")))	wheresql+="  and (crm_tggl.tgkssj<=TO_DATE('"+crm_tggl_tgkssj+"','YYYY/MM/DD'))";
	}
	crm_tggl_gjfgsj=request.getParameter("crm_tggl_gjfgsj");
	if (crm_tggl_gjfgsj!=null)
	{
		crm_tggl_gjfgsj=crm_tggl_gjfgsj.trim();
		if (!(crm_tggl_gjfgsj.equals("")))	wheresql+="  and (crm_tggl.gjfgsj>=TO_DATE('"+crm_tggl_gjfgsj+"','YYYY/MM/DD'))";
	}
	crm_tggl_gjfgsj=request.getParameter("crm_tggl_gjfgsj2");
	if (crm_tggl_gjfgsj!=null)
	{
		crm_tggl_gjfgsj=crm_tggl_gjfgsj.trim();
		if (!(crm_tggl_gjfgsj.equals("")))	wheresql+="  and (crm_tggl.gjfgsj<=TO_DATE('"+crm_tggl_gjfgsj+"','YYYY/MM/DD'))";
	}
	crm_tggl_tglrr=request.getParameter("crm_tggl_tglrr");
	if (crm_tggl_tglrr!=null)
	{
		crm_tggl_tglrr=cf.GB2Uni(crm_tggl_tglrr);
		if (!(crm_tggl_tglrr.equals("")))	wheresql+=" and  (crm_tggl.tglrr='"+crm_tggl_tglrr+"')";
	}
	crm_tggl_tglrsj=request.getParameter("crm_tggl_tglrsj");
	if (crm_tggl_tglrsj!=null)
	{
		crm_tggl_tglrsj=crm_tggl_tglrsj.trim();
		if (!(crm_tggl_tglrsj.equals("")))	wheresql+="  and (crm_tggl.tglrsj=TO_DATE('"+crm_tggl_tglrsj+"','YYYY/MM/DD'))";
	}
	crm_tggl_sjfgsj=request.getParameter("crm_tggl_sjfgsj");
	if (crm_tggl_sjfgsj!=null)
	{
		crm_tggl_sjfgsj=crm_tggl_sjfgsj.trim();
		if (!(crm_tggl_sjfgsj.equals("")))	wheresql+="  and (crm_tggl.sjfgsj>=TO_DATE('"+crm_tggl_sjfgsj+"','YYYY/MM/DD'))";
	}
	crm_tggl_sjfgsj=request.getParameter("crm_tggl_sjfgsj2");
	if (crm_tggl_sjfgsj!=null)
	{
		crm_tggl_sjfgsj=crm_tggl_sjfgsj.trim();
		if (!(crm_tggl_sjfgsj.equals("")))	wheresql+="  and (crm_tggl.sjfgsj<=TO_DATE('"+crm_tggl_sjfgsj+"','YYYY/MM/DD'))";
	}
	crm_tggl_fglrr=request.getParameter("crm_tggl_fglrr");
	if (crm_tggl_fglrr!=null)
	{
		crm_tggl_fglrr=cf.GB2Uni(crm_tggl_fglrr);
		if (!(crm_tggl_fglrr.equals("")))	wheresql+=" and  (crm_tggl.fglrr='"+crm_tggl_fglrr+"')";
	}
	crm_tggl_fglrsj=request.getParameter("crm_tggl_fglrsj");
	if (crm_tggl_fglrsj!=null)
	{
		crm_tggl_fglrsj=crm_tggl_fglrsj.trim();
		if (!(crm_tggl_fglrsj.equals("")))	wheresql+="  and (crm_tggl.fglrsj=TO_DATE('"+crm_tggl_fglrsj+"','YYYY/MM/DD'))";
	}
	crm_tggl_zt=request.getParameter("crm_tggl_zt");
	if (crm_tggl_zt!=null)
	{
		crm_tggl_zt=cf.GB2Uni(crm_tggl_zt);
		if (!(crm_tggl_zt.equals("")))	wheresql+=" and  (crm_tggl.zt='"+crm_tggl_zt+"')";
	}
	crm_tggl_lrr=request.getParameter("crm_tggl_lrr");
	if (crm_tggl_lrr!=null)
	{
		crm_tggl_lrr=cf.GB2Uni(crm_tggl_lrr);
		if (!(crm_tggl_lrr.equals("")))	wheresql+=" and  (crm_tggl.lrr='"+crm_tggl_lrr+"')";
	}
	crm_tggl_lrsj=request.getParameter("crm_tggl_lrsj");
	if (crm_tggl_lrsj!=null)
	{
		crm_tggl_lrsj=crm_tggl_lrsj.trim();
		if (!(crm_tggl_lrsj.equals("")))	wheresql+="  and (crm_tggl.lrsj=TO_DATE('"+crm_tggl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tggl_lrbm=request.getParameter("crm_tggl_lrbm");
	if (crm_tggl_lrbm!=null)
	{
		crm_tggl_lrbm=cf.GB2Uni(crm_tggl_lrbm);
		if (!(crm_tggl_lrbm.equals("")))	wheresql+=" and  (crm_tggl.lrbm='"+crm_tggl_lrbm+"')";
	}
	ls_sql="SELECT crm_tggl.djbh,crm_tggl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_tggl.tgsqr,crm_tggl.tgsqsj,crm_tggl.tgsqyy,crm_tggl.tgshr,crm_tggl.tgshsj, DECODE(crm_tggl.tgshjg,'Y','ͨ��','N','δͨ��'),crm_tggl.tgshsm,crm_tggl.tgyybm,crm_tggl.tgkssj,crm_tggl.gjfgsj,crm_tggl.tglrr,crm_tggl.tglrsj,crm_tggl.sjfgsj,crm_tggl.fglrr,crm_tggl.fglrsj,crm_tggl.fgsm, DECODE(crm_tggl.zt,'5','ͣ������','6','ͣ������','7','����ͣ��','8','������'),crm_tggl.lrr,crm_tggl.lrsj,dwmc,crm_tggl.bz  ";
	ls_sql+=" FROM crm_khxx,crm_tggl,sq_dwxx  ";
    ls_sql+=" where crm_tggl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_tggl.lrbm=sq_dwxx.dwbh(+)";
 
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_tgglCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"djbh","crm_tggl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_tggl_tgsqr","crm_tggl_tgsqsj","crm_tggl_tgsqyy","crm_tggl_tgshr","crm_tggl_tgshsj","crm_tggl_tgshjg","crm_tggl_tgshsm","crm_tggl_tgyybm","crm_tggl_tgkssj","crm_tggl_gjfgsj","crm_tggl_tglrr","crm_tggl_tglrsj","crm_tggl_sjfgsj","crm_tggl_fglrr","crm_tggl_fglrsj","crm_tggl_fgsm","crm_tggl_zt","crm_tggl_lrr","crm_tggl_lrsj","crm_tggl_lrbm","crm_tggl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

/*
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"djbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_xmycgl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("djbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">ͣ������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�ǼǱ��</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">���ʦ</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="13%">����ԭ��</td>
	<td  width="3%">ͣ�������</td>
	<td  width="3%">ͣ�����ʱ��</td>
	<td  width="3%">ͣ����˽��</td>
	<td  width="3%">ͣ�����˵��</td>
	<td  width="3%">ͣ��ԭ��</td>
	<td  width="3%">ͣ����ʼʱ��</td>
	<td  width="3%">���Ƹ�������</td>
	<td  width="3%">ͣ��¼����</td>
	<td  width="3%">ͣ��¼��ʱ��</td>
	<td  width="3%">ʵ�ʸ�������</td>
	<td  width="3%">����¼����</td>
	<td  width="3%">����¼��ʱ��</td>
	<td  width="3%">����˵��</td>
	<td  width="3%">״̬</td>
	<td  width="3%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="53%">��ע</td>
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