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
	
	String sgd=null;
	String sgbz=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (cw_sgdwgjsjlKB.sgd='"+sgd+"')";
	}
	sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		sgbz=cf.GB2Uni(sgbz);
		if (!(sgbz.equals("")))	wheresql+=" and  (cw_sgdwgjsjlKB.sgbz='"+sgbz+"')";
	}
	
	
	String gdjsjd=null;
	gdjsjd=request.getParameter("gdjsjd");
	if (gdjsjd!=null)
	{
		gdjsjd=cf.GB2Uni(gdjsjd);
		if (!(gdjsjd.equals("")))	wheresql+=" and  (crm_khxx.gdjsjd='"+gdjsjd+"')";
	}

	String cw_sgdwgjsjlKB_jsjlh=null;
	String cw_sgdwgjsjlKB_jsrq=null;
	String cw_sgdwgjsjlKB_jsbl=null;
	String cw_sgdwgjsjlKB_lrr=null;
	String cw_sgdwgjsjlKB_lrsj=null;
	cw_sgdwgjsjlKB_jsjlh=request.getParameter("cw_sgdwgjsjlKB_jsjlh");
	if (cw_sgdwgjsjlKB_jsjlh!=null)
	{
		cw_sgdwgjsjlKB_jsjlh=cf.GB2Uni(cw_sgdwgjsjlKB_jsjlh);
		if (!(cw_sgdwgjsjlKB_jsjlh.equals("")))	wheresql+=" and  (cw_sgdwgjsjlKB.jsjlh='"+cw_sgdwgjsjlKB_jsjlh+"')";
	}
	cw_sgdwgjsjlKB_jsrq=request.getParameter("cw_sgdwgjsjlKB_jsrq");
	if (cw_sgdwgjsjlKB_jsrq!=null)
	{
		cw_sgdwgjsjlKB_jsrq=cw_sgdwgjsjlKB_jsrq.trim();
		if (!(cw_sgdwgjsjlKB_jsrq.equals("")))	wheresql+="  and (cw_sgdwgjsjlKB.jsrq>=TO_DATE('"+cw_sgdwgjsjlKB_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdwgjsjlKB_jsrq=request.getParameter("cw_sgdwgjsjlKB_jsrq2");
	if (cw_sgdwgjsjlKB_jsrq!=null)
	{
		cw_sgdwgjsjlKB_jsrq=cw_sgdwgjsjlKB_jsrq.trim();
		if (!(cw_sgdwgjsjlKB_jsrq.equals("")))	wheresql+="  and (cw_sgdwgjsjlKB.jsrq<=TO_DATE('"+cw_sgdwgjsjlKB_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdwgjsjlKB_jsbl=request.getParameter("cw_sgdwgjsjlKB_jsbl");
	if (cw_sgdwgjsjlKB_jsbl!=null)
	{
		cw_sgdwgjsjlKB_jsbl=cw_sgdwgjsjlKB_jsbl.trim();
		if (!(cw_sgdwgjsjlKB_jsbl.equals("")))	wheresql+=" and  (cw_sgdwgjsjlKB.jsbl>="+cw_sgdwgjsjlKB_jsbl+") ";
	}
	cw_sgdwgjsjlKB_jsbl=request.getParameter("cw_sgdwgjsjlKB_jsbl");
	if (cw_sgdwgjsjlKB_jsbl!=null)
	{
		cw_sgdwgjsjlKB_jsbl=cw_sgdwgjsjlKB_jsbl.trim();
		if (!(cw_sgdwgjsjlKB_jsbl.equals("")))	wheresql+=" and  (cw_sgdwgjsjlKB.jsbl<="+cw_sgdwgjsjlKB_jsbl+") ";
	}
	cw_sgdwgjsjlKB_lrsj=request.getParameter("cw_sgdwgjsjlKB_lrsj");
	if (cw_sgdwgjsjlKB_lrsj!=null)
	{
		cw_sgdwgjsjlKB_lrsj=cw_sgdwgjsjlKB_lrsj.trim();
		if (!(cw_sgdwgjsjlKB_lrsj.equals("")))	wheresql+="  and (cw_sgdwgjsjlKB.lrsj>=TO_DATE('"+cw_sgdwgjsjlKB_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdwgjsjlKB_lrsj=request.getParameter("cw_sgdwgjsjlKB_lrsj2");
	if (cw_sgdwgjsjlKB_lrsj!=null)
	{
		cw_sgdwgjsjlKB_lrsj=cw_sgdwgjsjlKB_lrsj.trim();
		if (!(cw_sgdwgjsjlKB_lrsj.equals("")))	wheresql+="  and (cw_sgdwgjsjlKB.lrsj<=TO_DATE('"+cw_sgdwgjsjlKB_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdwgjsjlKB_lrr=request.getParameter("cw_sgdwgjsjlKB_lrr");
	if (cw_sgdwgjsjlKB_lrr!=null)
	{
		cw_sgdwgjsjlKB_lrr=cf.GB2Uni(cw_sgdwgjsjlKB_lrr);
		if (!(cw_sgdwgjsjlKB_lrr.equals("")))	wheresql+=" and  (cw_sgdwgjsjlKB.lrr='"+cw_sgdwgjsjlKB_lrr+"')";
	}

	ls_sql="SELECT cw_sgdwgjsjlkb.jsjlh,gdjsjdmc,cw_sgdwgjsjlkb.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,sgdmc,crm_khxx.sjs,cw_sgdwgjsjlkb.sgbz,cw_sgdwgjsjlkb.jsrq,htje,cw_sgdwgjsjlKB.suijin,cw_sgdwgjsjlKB.glf,cw_sgdwgjsjlKB.gczxzq,cw_sgdwgjsjlKB.gcjxzq,gcjse,jsbl,jsje,kzbjbl,kzb,gcglfk,gcqtfk,jsyfje,clfk,llje,yfgck,ykgccf,qtkk,xcyxfy,clyf,gcsfje,cw_sgdwgjsjlkb.lrr,cw_sgdwgjsjlkb.lrsj,cw_sgdwgjsjlkb.lrbm,cw_sgdwgjsjlkb.bz ";
	ls_sql+=" FROM crm_khxx,cw_sgdwgjsjlKB,sq_sgd,sq_dwxx,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdwgjsjlKB.khbh=crm_khxx.khbh(+) and cw_sgdwgjsjlKB.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdwgjsjlKB.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_khxx.gdjsjd=dm_gdjsjd.gdjsjd(+)";
    ls_sql+=" and crm_khxx.gdjsjd='8'";//8:�깤����

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

    ls_sql+=wheresql;
	ls_sql+=" order by cw_sgdwgjsjlKB.jsrq desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khxxCxFpList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","cw_sgdwgjsjlKB_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","sgd","sgbz","cw_sgdwgjsjlKB_jsrq","cw_sgdwgjsjlKB_jskjs","cw_sgdwgjsjlKB_jsbl","cw_sgdwgjsjlKB_jsje","cw_sgdwgjsjlKB_lrr","cw_sgdwgjsjlKB_lrsj","cw_sgdwgjsjlKB_lrbm","cw_sgdwgjsjlKB_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"�Ǽ�"};//��ť����ʾ����
	String[] buttonLink={"SaveJsFp.jsp"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewCw_sgdwgjsjlkb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jsjlh",coluParm);//�в����������Hash��
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
  <B><font size="3">ʩ�����깤���㣭�ѽ���Ʊ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">�����¼��</td>
	<td  width="2%">�������</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ֳ�������</td>

	<td  width="2%">��������</td>
	<td  width="2%">��ͬ���</td>
	<td  width="2%">˰��</td>
	<td  width="2%">�����</td>
	<td  width="2%">��������</td>
	<td  width="2%">���̼���</td>
	<td  width="2%">���̽����</td>
	<td  width="2%">�а��������</td>
	<td  width="2%">������</td>

	<td  width="2%">Ӧ���ʱ������</td>
	<td  width="2%">���ʱ���</td>
	<td  width="2%">���̹�����</td>
	<td  width="2%">������������</td>
	<td  width="2%">����Ӧ�����</td>
	
	<td  width="2%">�������󴦷�</td>
	<td  width="2%">�ⷿ���Ͻ��</td>
	<td  width="2%">�Ѹ����̿�</td>
	<td  width="2%">�ѿ۹��̴���</td>
	<td  width="2%">�����ۿ�</td>
	<td  width="2%">�ֳ�Ӫ������</td>
	<td  width="2%">�����˷�</td>
	<td  width="2%">����ʵ�����</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">¼�벿��</td>
	<td  width="32%">��ע</td>
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