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
	String ybj_ybjsb_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_kgrq=null;
	String crm_khxx_sjkgrq=null;
	String crm_khxx_jgrq=null;
	String crm_khxx_sjjgrq=null;
	String dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String ssfgs=null;
	String ybj_ybjsb_sbr=null;
	String ybj_ybjsb_sbsj=null;
	String ybj_ybjsb_shr=null;
	String ybj_ybjsb_shsj=null;
	String ybj_ybjsb_shjl=null;
	String ybj_ybjsb_shsm=null;
	String ybj_ybjsb_clzt=null;

	
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (ybj_ybjsb.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (ybj_ybjsb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (ybj_ybjsb.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	
	
	ybj_ybjsb_khbh=request.getParameter("ybj_ybjsb_khbh");
	if (ybj_ybjsb_khbh!=null)
	{
		ybj_ybjsb_khbh=cf.GB2Uni(ybj_ybjsb_khbh);
		if (!(ybj_ybjsb_khbh.equals("")))	wheresql+=" and  (ybj_ybjsb.khbh='"+ybj_ybjsb_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
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
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq=TO_DATE('"+crm_khxx_kgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjkgrq=request.getParameter("crm_khxx_sjkgrq");
	if (crm_khxx_sjkgrq!=null)
	{
		crm_khxx_sjkgrq=crm_khxx_sjkgrq.trim();
		if (!(crm_khxx_sjkgrq.equals("")))	wheresql+="  and (crm_khxx.sjkgrq=TO_DATE('"+crm_khxx_sjkgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq=TO_DATE('"+crm_khxx_jgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjjgrq=request.getParameter("crm_khxx_sjjgrq");
	if (crm_khxx_sjjgrq!=null)
	{
		crm_khxx_sjjgrq=crm_khxx_sjjgrq.trim();
		if (!(crm_khxx_sjjgrq.equals("")))	wheresql+="  and (crm_khxx.sjjgrq=TO_DATE('"+crm_khxx_sjjgrq+"','YYYY/MM/DD'))";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
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
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (ybj_ybjsb.ssfgs='"+ssfgs+"')";
	}
	ybj_ybjsb_sbr=request.getParameter("ybj_ybjsb_sbr");
	if (ybj_ybjsb_sbr!=null)
	{
		ybj_ybjsb_sbr=cf.GB2Uni(ybj_ybjsb_sbr);
		if (!(ybj_ybjsb_sbr.equals("")))	wheresql+=" and  (ybj_ybjsb.sbr='"+ybj_ybjsb_sbr+"')";
	}
	ybj_ybjsb_sbsj=request.getParameter("ybj_ybjsb_sbsj");
	if (ybj_ybjsb_sbsj!=null)
	{
		ybj_ybjsb_sbsj=ybj_ybjsb_sbsj.trim();
		if (!(ybj_ybjsb_sbsj.equals("")))	wheresql+="  and (ybj_ybjsb.sbsj>=TO_DATE('"+ybj_ybjsb_sbsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjsb_sbsj=request.getParameter("ybj_ybjsb_sbsj2");
	if (ybj_ybjsb_sbsj!=null)
	{
		ybj_ybjsb_sbsj=ybj_ybjsb_sbsj.trim();
		if (!(ybj_ybjsb_sbsj.equals("")))	wheresql+="  and (ybj_ybjsb.sbsj<=TO_DATE('"+ybj_ybjsb_sbsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjsb_shr=request.getParameter("ybj_ybjsb_shr");
	if (ybj_ybjsb_shr!=null)
	{
		ybj_ybjsb_shr=cf.GB2Uni(ybj_ybjsb_shr);
		if (!(ybj_ybjsb_shr.equals("")))	wheresql+=" and  (ybj_ybjsb.shr='"+ybj_ybjsb_shr+"')";
	}
	ybj_ybjsb_shsj=request.getParameter("ybj_ybjsb_shsj");
	if (ybj_ybjsb_shsj!=null)
	{
		ybj_ybjsb_shsj=ybj_ybjsb_shsj.trim();
		if (!(ybj_ybjsb_shsj.equals("")))	wheresql+="  and (ybj_ybjsb.shsj>=TO_DATE('"+ybj_ybjsb_shsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjsb_shsj=request.getParameter("ybj_ybjsb_shsj2");
	if (ybj_ybjsb_shsj!=null)
	{
		ybj_ybjsb_shsj=ybj_ybjsb_shsj.trim();
		if (!(ybj_ybjsb_shsj.equals("")))	wheresql+="  and (ybj_ybjsb.shsj<=TO_DATE('"+ybj_ybjsb_shsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjsb_shjl=request.getParameter("ybj_ybjsb_shjl");
	if (ybj_ybjsb_shjl!=null)
	{
		ybj_ybjsb_shjl=cf.GB2Uni(ybj_ybjsb_shjl);
		if (!(ybj_ybjsb_shjl.equals("")))	wheresql+=" and  (ybj_ybjsb.shjl='"+ybj_ybjsb_shjl+"')";
	}
	ybj_ybjsb_shsm=request.getParameter("ybj_ybjsb_shsm");
	if (ybj_ybjsb_shsm!=null)
	{
		ybj_ybjsb_shsm=cf.GB2Uni(ybj_ybjsb_shsm);
		if (!(ybj_ybjsb_shsm.equals("")))	wheresql+=" and  (ybj_ybjsb.shsm='"+ybj_ybjsb_shsm+"')";
	}
	ybj_ybjsb_clzt=request.getParameter("ybj_ybjsb_clzt");
	if (ybj_ybjsb_clzt!=null)
	{
		ybj_ybjsb_clzt=cf.GB2Uni(ybj_ybjsb_clzt);
		if (!(ybj_ybjsb_clzt.equals("")))	wheresql+=" and  (ybj_ybjsb.clzt='"+ybj_ybjsb_clzt+"')";
	}

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm, DECODE(ybj_ybjsb.clzt,'1','δ���','2','�����'), DECODE(ybj_ybjsb.shjl,'Y','�ϸ�','N','���ϸ�'),ybj_ybjsb.shr,ybj_ybjsb.shsj,ybj_ybjsb.shsm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.zjxm,sq_dwxx.dwmc ssfgs,ybj_ybjsb.sbr,ybj_ybjsb.sbsj,ybj_ybjsb.ybjyxq,ybj_ybjsb.lrr,ybj_ybjsb.lrsj,ybj_ybjsb.bz  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,ybj_ybjsb  ";
    ls_sql+=" where ybj_ybjsb.khbh=crm_khxx.khbh and ybj_ybjsb.ssfgs=sq_dwxx.dwbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by ybj_ybjsb.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Ybj_ybjsbFbList.jsp","SelectFbYbj_ybjsb.jsp","","FbEditYbj_ybjsb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("����");//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm","sq_dwxx_dwmc","ybj_ybjsb_sbr","ybj_ybjsb_sbsj","ybj_ybjsb_shjl","ybj_ybjsb_clzt","ybj_ybjsb_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"��������"};//��ť����ʾ����
	String[] buttonLink={"Ybj_ybjsbFbList.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String yhmc=(String)session.getAttribute("yhmc");
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="update ybj_ybjsb set fbr='"+yhmc+"',fbsj=TRUNC(SYSDATE),fbsm='��������',clzt='3' where "+chooseitem;
		sql[1]="update crm_khxx set ybjbz='Y',ybjdjsj=TRUNC(SYSDATE),ybjyxq=(select ybjyxq from ybj_ybjsb where ybj_ybjsb.khbh=crm_khxx.khbh) where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����䷢��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="4%">״̬</td>
	<td  width="4%">��˽���</td>
	<td  width="3%">�����</td>
	<td  width="5%">���ʱ��</td>
	<td  width="13%">���˵��</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�ʼ�</td>
	<td  width="6%">�����ֹ�˾</td>
	<td  width="3%">�걨��</td>
	<td  width="5%">�걨ʱ��</td>
	<td  width="5%">�������Ч��</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="12%">��ע</td>
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