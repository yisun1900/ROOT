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



	String cw_jrsgdjs_jsjlh=null;
	String cw_jrsgdjs_sgd=null;
	String cw_jrsgdjs_sgbz=null;
	String cw_jrsgdjs_jsrq=null;
	String cw_jrsgdjs_lx=null;
	String cw_jrsgdjs_clzt=null;
	String cw_jrsgdjs_spr=null;
	String cw_jrsgdjs_spsj=null;
	String cw_jrsgdjs_lrr=null;
	String cw_jrsgdjs_lrsj=null;
	String cw_jrsgdjs_lrbm=null;
	cw_jrsgdjs_jsjlh=request.getParameter("cw_jrsgdjs_jsjlh");
	if (cw_jrsgdjs_jsjlh!=null)
	{
		cw_jrsgdjs_jsjlh=cf.GB2Uni(cw_jrsgdjs_jsjlh);
		if (!(cw_jrsgdjs_jsjlh.equals("")))	wheresql+=" and  (cw_jrsgdjs.jsjlh='"+cw_jrsgdjs_jsjlh+"')";
	}
	cw_jrsgdjs_sgd=request.getParameter("cw_jrsgdjs_sgd");
	if (cw_jrsgdjs_sgd!=null)
	{
		cw_jrsgdjs_sgd=cf.GB2Uni(cw_jrsgdjs_sgd);
		if (!(cw_jrsgdjs_sgd.equals("")))	wheresql+=" and  (cw_jrsgdjs.sgd='"+cw_jrsgdjs_sgd+"')";
	}
	cw_jrsgdjs_sgbz=request.getParameter("cw_jrsgdjs_sgbz");
	if (cw_jrsgdjs_sgbz!=null)
	{
		cw_jrsgdjs_sgbz=cf.GB2Uni(cw_jrsgdjs_sgbz);
		if (!(cw_jrsgdjs_sgbz.equals("")))	wheresql+=" and  (cw_jrsgdjs.sgbz='"+cw_jrsgdjs_sgbz+"')";
	}
	cw_jrsgdjs_jsrq=request.getParameter("cw_jrsgdjs_jsrq");
	if (cw_jrsgdjs_jsrq!=null)
	{
		cw_jrsgdjs_jsrq=cw_jrsgdjs_jsrq.trim();
		if (!(cw_jrsgdjs_jsrq.equals("")))	wheresql+="  and (cw_jrsgdjs.jsrq>=TO_DATE('"+cw_jrsgdjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_jsrq=request.getParameter("cw_jrsgdjs_jsrq2");
	if (cw_jrsgdjs_jsrq!=null)
	{
		cw_jrsgdjs_jsrq=cw_jrsgdjs_jsrq.trim();
		if (!(cw_jrsgdjs_jsrq.equals("")))	wheresql+="  and (cw_jrsgdjs.jsrq<=TO_DATE('"+cw_jrsgdjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_lx=request.getParameter("cw_jrsgdjs_lx");
	if (cw_jrsgdjs_lx!=null)
	{
		cw_jrsgdjs_lx=cf.GB2Uni(cw_jrsgdjs_lx);
		if (!(cw_jrsgdjs_lx.equals("")))	wheresql+=" and  (cw_jrsgdjs.lx='"+cw_jrsgdjs_lx+"')";
	}
	cw_jrsgdjs_clzt=request.getParameter("cw_jrsgdjs_clzt");
	if (cw_jrsgdjs_clzt!=null)
	{
		cw_jrsgdjs_clzt=cf.GB2Uni(cw_jrsgdjs_clzt);
		if (!(cw_jrsgdjs_clzt.equals("")))	wheresql+=" and  (cw_jrsgdjs.clzt='"+cw_jrsgdjs_clzt+"')";
	}
	cw_jrsgdjs_spr=request.getParameter("cw_jrsgdjs_spr");
	if (cw_jrsgdjs_spr!=null)
	{
		cw_jrsgdjs_spr=cf.GB2Uni(cw_jrsgdjs_spr);
		if (!(cw_jrsgdjs_spr.equals("")))	wheresql+=" and  (cw_jrsgdjs.spr='"+cw_jrsgdjs_spr+"')";
	}
	cw_jrsgdjs_spsj=request.getParameter("cw_jrsgdjs_spsj");
	if (cw_jrsgdjs_spsj!=null)
	{
		cw_jrsgdjs_spsj=cw_jrsgdjs_spsj.trim();
		if (!(cw_jrsgdjs_spsj.equals("")))	wheresql+="  and (cw_jrsgdjs.spsj>=TO_DATE('"+cw_jrsgdjs_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_spsj=request.getParameter("cw_jrsgdjs_spsj2");
	if (cw_jrsgdjs_spsj!=null)
	{
		cw_jrsgdjs_spsj=cw_jrsgdjs_spsj.trim();
		if (!(cw_jrsgdjs_spsj.equals("")))	wheresql+="  and (cw_jrsgdjs.spsj<=TO_DATE('"+cw_jrsgdjs_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_lrr=request.getParameter("cw_jrsgdjs_lrr");
	if (cw_jrsgdjs_lrr!=null)
	{
		cw_jrsgdjs_lrr=cf.GB2Uni(cw_jrsgdjs_lrr);
		if (!(cw_jrsgdjs_lrr.equals("")))	wheresql+=" and  (cw_jrsgdjs.lrr='"+cw_jrsgdjs_lrr+"')";
	}
	cw_jrsgdjs_lrsj=request.getParameter("cw_jrsgdjs_lrsj");
	if (cw_jrsgdjs_lrsj!=null)
	{
		cw_jrsgdjs_lrsj=cw_jrsgdjs_lrsj.trim();
		if (!(cw_jrsgdjs_lrsj.equals("")))	wheresql+="  and (cw_jrsgdjs.lrsj>=TO_DATE('"+cw_jrsgdjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_lrsj=request.getParameter("cw_jrsgdjs_lrsj2");
	if (cw_jrsgdjs_lrsj!=null)
	{
		cw_jrsgdjs_lrsj=cw_jrsgdjs_lrsj.trim();
		if (!(cw_jrsgdjs_lrsj.equals("")))	wheresql+="  and (cw_jrsgdjs.lrsj<=TO_DATE('"+cw_jrsgdjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_lrbm=request.getParameter("cw_jrsgdjs_lrbm");
	if (cw_jrsgdjs_lrbm!=null)
	{
		cw_jrsgdjs_lrbm=cf.GB2Uni(cw_jrsgdjs_lrbm);
		if (!(cw_jrsgdjs_lrbm.equals("")))	wheresql+=" and  (cw_jrsgdjs.lrbm='"+cw_jrsgdjs_lrbm+"')";
	}
	ls_sql="SELECT cw_jrsgdjs.jsjlh,gdjsjdmc, DECODE(cw_jrsgdjs.clzt,'1','����','2','����ͬ��','3','������ͬ��'),crm_khxx.khxm,crm_khxx.fwdz,bjjbmc,sgdmc,cw_jrsgdjs.bcfkhj,cw_jrsgdjs.jsrq,cw_jrsgdjs.sgbz,crm_khxx.hth,cw_jrsgdjs.khbh,TO_CHAR(cw_jrsgdjs.ysglk),TO_CHAR(cw_jrsgdjs.zjsge),TO_CHAR(cw_jrsgdjs.cfje),TO_CHAR(cw_jrsgdjs.jsglk),cw_jrsgdjs.rgfbfb||'%',TO_CHAR(cw_jrsgdjs.yfrgf),cw_jrsgdjs.bcrgf,cw_jrsgdjs.flkbfb||'%',TO_CHAR(cw_jrsgdjs.ycflk),TO_CHAR(cw_jrsgdjs.kjflk),cw_jrsgdjs.bcflk,cw_jrsgdjs.gsfl,cw_jrsgdjs.psfl,cw_jrsgdjs.kzbjbl||'%',cw_jrsgdjs.kzbj,cw_jrsgdjs.fk,cw_jrsgdjs.bx,cw_jrsgdjs.rybx,cw_jrsgdjs.pck,cw_jrsgdjs.kqtk,cw_jrsgdjs.kqtksm,cw_jrsgdjs.spr,cw_jrsgdjs.spsj,cw_jrsgdjs.spyj,cw_jrsgdjs.lrr,cw_jrsgdjs.lrsj,dwmc,cw_jrsgdjs.bz  ";
	ls_sql+=" FROM crm_khxx,cw_jrsgdjs,dm_gdjsjd,sq_sgd,sq_dwxx,bdm_bjjbbm  ";
    ls_sql+=" where cw_jrsgdjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_jrsgdjs.lx=dm_gdjsjd.gdjsjd(+)";
    ls_sql+=" and cw_jrsgdjs.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_jrsgdjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and cw_jrsgdjs.clzt='1'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrsgdjs.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jrsgdjsList.jsp","","","EditCw_jrsgdjs.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","cw_jrsgdjs_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","cw_jrsgdjs_sgd","cw_jrsgdjs_sgbz","cw_jrsgdjs_jsrq","cw_jrsgdjs_ysglk","cw_jrsgdjs_zjsge","cw_jrsgdjs_cfje","cw_jrsgdjs_jsglk","cw_jrsgdjs_rgfbfb","cw_jrsgdjs_yfrgf","cw_jrsgdjs_bcrgf","cw_jrsgdjs_flkbfb","cw_jrsgdjs_ycflk","cw_jrsgdjs_bcflk","cw_jrsgdjs_gsfl","cw_jrsgdjs_psfl","cw_jrsgdjs_kzbjbl","cw_jrsgdjs_kzbj","cw_jrsgdjs_fk","cw_jrsgdjs_kqtk","cw_jrsgdjs_kqtksm","cw_jrsgdjs_bcfkhj","cw_jrsgdjs_lx","cw_jrsgdjs_clzt","cw_jrsgdjs_spr","cw_jrsgdjs_spsj","cw_jrsgdjs_spyj","cw_jrsgdjs_lrr","cw_jrsgdjs_lrsj","cw_jrsgdjs_lrbm","cw_jrsgdjs_bz","cw_jrsgdjs_bx","cw_jrsgdjs_pck"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCw_jrsgdjs.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
  <B><font size="3">�깤���㣭�޸�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(430);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">�����¼��</td>
	<td  width="2%">����</td>
	<td  width="2%">����״̬</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="5%">���ݵ�ַ</td>
	<td  width="2%">���ۼ���</td>
	<td  width="2%">ʩ����</td>
	<td  width="3%">���θ���ϼ�</td>
	<td  width="2%">��������</td>
	<td  width="2%">ʩ���೤</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="3%">Ԥ�㹤�Ͽ�</td>
	<td  width="2%">����ʩ����</td>
	<td  width="2%">������</td>
	<td  width="2%">���㹤�Ͽ�</td>
	<td  width="2%">�˹��Ѱٷֱ�</td>
	<td  width="2%">�Ѹ��˹���</td>
	<td  width="2%">����Ӧ���˹���</td>
	<td  width="2%">���Ͽ�ٷֱ�</td>
	<td  width="2%">�ѳ帨�Ͽ�</td>
	<td  width="2%">�ۼ����Ͽ�</td>
	<td  width="2%">����Ӧ���˸��Ͽ�</td>
	<td  width="2%">��˾����</td>
	<td  width="2%">���͸���</td>
	<td  width="2%">���ʱ������</td>
	<td  width="2%">���ʱ���</td>
	<td  width="2%">����</td>
	<td  width="2%">���ر���</td>
	<td  width="2%">��Ա����</td>
	<td  width="2%">�⳥��</td>
	<td  width="2%">��������</td>
	<td  width="6%">��������˵��</td>
	<td  width="2%">������</td>
	<td  width="2%">����ʱ��</td>
	<td  width="7%">�������</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="3%">¼�벿��</td>
	<td  width="9%">��ע</td>
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