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
	String crm_fbdgl_fbdbh=null;

	String crm_fbdgl_cpflbm=null;
	String crm_fbdgl_cpjkr=null;
	String crm_fbdgl_fssj=null;
	String crm_fbdgl_jhbhwcsj=null;
	String crm_fbdgl_jhazsj=null;
	String crm_fbdgl_falrr=null;
	String crm_fbdgl_falrsj=null;
	String crm_fbdgl_xdsj=null;
	String crm_fbdgl_bhwcrq=null;
	String crm_fbdgl_zt=null;
	String crm_fbdgl_lrr=null;
	String crm_fbdgl_lrsj=null;
	String crm_fbdgl_lrbm=null;

	
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

	
	
	crm_fbdgl_fbdbh=request.getParameter("crm_fbdgl_fbdbh");
	if (crm_fbdgl_fbdbh!=null)
	{
		crm_fbdgl_fbdbh=cf.GB2Uni(crm_fbdgl_fbdbh);
		if (!(crm_fbdgl_fbdbh.equals("")))	wheresql+=" and  (crm_fbdgl.fbdbh='"+crm_fbdgl_fbdbh+"')";
	}

	crm_fbdgl_cpflbm=request.getParameter("crm_fbdgl_cpflbm");
	if (crm_fbdgl_cpflbm!=null)
	{
		crm_fbdgl_cpflbm=cf.GB2Uni(crm_fbdgl_cpflbm);
		if (!(crm_fbdgl_cpflbm.equals("")))	wheresql+=" and  (crm_fbdgl.cpflbm='"+crm_fbdgl_cpflbm+"')";
	}
	crm_fbdgl_cpjkr=request.getParameter("crm_fbdgl_cpjkr");
	if (crm_fbdgl_cpjkr!=null)
	{
		crm_fbdgl_cpjkr=cf.GB2Uni(crm_fbdgl_cpjkr);
		if (!(crm_fbdgl_cpjkr.equals("")))	wheresql+=" and  (crm_fbdgl.cpjkr='"+crm_fbdgl_cpjkr+"')";
	}
	crm_fbdgl_fssj=request.getParameter("crm_fbdgl_fssj");
	if (crm_fbdgl_fssj!=null)
	{
		crm_fbdgl_fssj=crm_fbdgl_fssj.trim();
		if (!(crm_fbdgl_fssj.equals("")))	wheresql+="  and (crm_fbdgl.fssj>=TO_DATE('"+crm_fbdgl_fssj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_fssj=request.getParameter("crm_fbdgl_fssj2");
	if (crm_fbdgl_fssj!=null)
	{
		crm_fbdgl_fssj=crm_fbdgl_fssj.trim();
		if (!(crm_fbdgl_fssj.equals("")))	wheresql+="  and (crm_fbdgl.fssj<=TO_DATE('"+crm_fbdgl_fssj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_jhbhwcsj=request.getParameter("crm_fbdgl_jhbhwcsj");
	if (crm_fbdgl_jhbhwcsj!=null)
	{
		crm_fbdgl_jhbhwcsj=crm_fbdgl_jhbhwcsj.trim();
		if (!(crm_fbdgl_jhbhwcsj.equals("")))	wheresql+="  and (crm_fbdgl.jhbhwcsj>=TO_DATE('"+crm_fbdgl_jhbhwcsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_jhbhwcsj=request.getParameter("crm_fbdgl_jhbhwcsj2");
	if (crm_fbdgl_jhbhwcsj!=null)
	{
		crm_fbdgl_jhbhwcsj=crm_fbdgl_jhbhwcsj.trim();
		if (!(crm_fbdgl_jhbhwcsj.equals("")))	wheresql+="  and (crm_fbdgl.jhbhwcsj<=TO_DATE('"+crm_fbdgl_jhbhwcsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_jhazsj=request.getParameter("crm_fbdgl_jhazsj");
	if (crm_fbdgl_jhazsj!=null)
	{
		crm_fbdgl_jhazsj=crm_fbdgl_jhazsj.trim();
		if (!(crm_fbdgl_jhazsj.equals("")))	wheresql+="  and (crm_fbdgl.jhazsj>=TO_DATE('"+crm_fbdgl_jhazsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_jhazsj=request.getParameter("crm_fbdgl_jhazsj2");
	if (crm_fbdgl_jhazsj!=null)
	{
		crm_fbdgl_jhazsj=crm_fbdgl_jhazsj.trim();
		if (!(crm_fbdgl_jhazsj.equals("")))	wheresql+="  and (crm_fbdgl.jhazsj<=TO_DATE('"+crm_fbdgl_jhazsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_falrr=request.getParameter("crm_fbdgl_falrr");
	if (crm_fbdgl_falrr!=null)
	{
		crm_fbdgl_falrr=cf.GB2Uni(crm_fbdgl_falrr);
		if (!(crm_fbdgl_falrr.equals("")))	wheresql+=" and  (crm_fbdgl.falrr='"+crm_fbdgl_falrr+"')";
	}
	crm_fbdgl_falrsj=request.getParameter("crm_fbdgl_falrsj");
	if (crm_fbdgl_falrsj!=null)
	{
		crm_fbdgl_falrsj=crm_fbdgl_falrsj.trim();
		if (!(crm_fbdgl_falrsj.equals("")))	wheresql+="  and (crm_fbdgl.falrsj=TO_DATE('"+crm_fbdgl_falrsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_xdsj=request.getParameter("crm_fbdgl_xdsj");
	if (crm_fbdgl_xdsj!=null)
	{
		crm_fbdgl_xdsj=crm_fbdgl_xdsj.trim();
		if (!(crm_fbdgl_xdsj.equals("")))	wheresql+="  and (crm_fbdgl.xdsj>=TO_DATE('"+crm_fbdgl_xdsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_xdsj=request.getParameter("crm_fbdgl_xdsj2");
	if (crm_fbdgl_xdsj!=null)
	{
		crm_fbdgl_xdsj=crm_fbdgl_xdsj.trim();
		if (!(crm_fbdgl_xdsj.equals("")))	wheresql+="  and (crm_fbdgl.xdsj<=TO_DATE('"+crm_fbdgl_xdsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_bhwcrq=request.getParameter("crm_fbdgl_bhwcrq");
	if (crm_fbdgl_bhwcrq!=null)
	{
		crm_fbdgl_bhwcrq=crm_fbdgl_bhwcrq.trim();
		if (!(crm_fbdgl_bhwcrq.equals("")))	wheresql+="  and (crm_fbdgl.bhwcrq>=TO_DATE('"+crm_fbdgl_bhwcrq+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_bhwcrq=request.getParameter("crm_fbdgl_bhwcrq2");
	if (crm_fbdgl_bhwcrq!=null)
	{
		crm_fbdgl_bhwcrq=crm_fbdgl_bhwcrq.trim();
		if (!(crm_fbdgl_bhwcrq.equals("")))	wheresql+="  and (crm_fbdgl.bhwcrq<=TO_DATE('"+crm_fbdgl_bhwcrq+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_zt=request.getParameter("crm_fbdgl_zt");
	if (crm_fbdgl_zt!=null)
	{
		crm_fbdgl_zt=cf.GB2Uni(crm_fbdgl_zt);
		if (!(crm_fbdgl_zt.equals("")))	wheresql+=" and  (crm_fbdgl.zt='"+crm_fbdgl_zt+"')";
	}
	crm_fbdgl_lrr=request.getParameter("crm_fbdgl_lrr");
	if (crm_fbdgl_lrr!=null)
	{
		crm_fbdgl_lrr=cf.GB2Uni(crm_fbdgl_lrr);
		if (!(crm_fbdgl_lrr.equals("")))	wheresql+=" and  (crm_fbdgl.lrr='"+crm_fbdgl_lrr+"')";
	}
	crm_fbdgl_lrsj=request.getParameter("crm_fbdgl_lrsj");
	if (crm_fbdgl_lrsj!=null)
	{
		crm_fbdgl_lrsj=crm_fbdgl_lrsj.trim();
		if (!(crm_fbdgl_lrsj.equals("")))	wheresql+="  and (crm_fbdgl.lrsj>=TO_DATE('"+crm_fbdgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_lrsj=request.getParameter("crm_fbdgl_lrsj2");
	if (crm_fbdgl_lrsj!=null)
	{
		crm_fbdgl_lrsj=crm_fbdgl_lrsj.trim();
		if (!(crm_fbdgl_lrsj.equals("")))	wheresql+="  and (crm_fbdgl.lrsj<=TO_DATE('"+crm_fbdgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_lrbm=request.getParameter("crm_fbdgl_lrbm");
	if (crm_fbdgl_lrbm!=null)
	{
		crm_fbdgl_lrbm=cf.GB2Uni(crm_fbdgl_lrbm);
		if (!(crm_fbdgl_lrbm.equals("")))	wheresql+=" and  (crm_fbdgl.lrbm='"+crm_fbdgl_lrbm+"')";
	}
	ls_sql="SELECT crm_fbdgl.fbdbh,DECODE(crm_fbdgl.zt,'1','¼��','2','������','3','�µ�','4','�������','9','��װ���'),cpflmc,crm_fbdgl.fssj,crm_fbdgl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_fbdgl.qksm,crm_fbdgl.cpjkr,crm_fbdgl.cpkf,crm_fbdgl.vipkf,crm_fbdgl.cplhsj,crm_fbdgl.jhbhwcsj,crm_fbdgl.jhazsj,crm_fbdgl.fbwxfa,crm_fbdgl.falrr,crm_fbdgl.falrsj,crm_fbdgl.xdsj,crm_fbdgl.xdr,crm_fbdgl.bhwcrq,crm_fbdgl.bhlrr,crm_fbdgl.lrr,crm_fbdgl.lrsj,dwmc,crm_fbdgl.bz ";
	ls_sql+=" FROM crm_fbdgl,crm_khxx,dm_cpflbm,sq_dwxx  ";
    ls_sql+=" where crm_fbdgl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_fbdgl.cpflbm=dm_cpflbm.cpflbm(+)";
    ls_sql+=" and crm_fbdgl.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_fbdgl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_fbdglXgBhList.jsp","","","XgBhCrm_fbdgl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"fbdbh","crm_fbdgl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_fbdgl_cpflbm","crm_fbdgl_cpjkr","crm_fbdgl_cpkf","crm_fbdgl_vipkf","crm_fbdgl_fssj","crm_fbdgl_cplhsj","crm_fbdgl_jhbhwcsj","crm_fbdgl_jhazsj","crm_fbdgl_fbwxfa","crm_fbdgl_falrr","crm_fbdgl_falrsj","crm_fbdgl_xdsj","crm_fbdgl_xdr","crm_fbdgl_bhwcrq","crm_fbdgl_bhlrr","crm_fbdgl_sjazsj","crm_fbdgl_azlrr","crm_fbdgl_azsfcg","crm_fbdgl_zt","crm_fbdgl_lrr","crm_fbdgl_lrsj","crm_fbdgl_lrbm","crm_fbdgl_bz","crm_fbdgl_qksm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fbdbh"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("���� ");

//���ð�ť����
	String[] buttonName={"ɾ������"};//��ť����ʾ����
	String[] buttonLink={"Crm_fbdglXgBhList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);


/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] fbdbh = request.getParameterValues("fbdbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(fbdbh,"fbdbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update crm_fbdgl set bhlrr=null,bhwcrq=null,zt='3' where zt='4' and "+chooseitem;
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
  <B><font size="3">����ά�޵������޸ı���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">���������</td>
	<td  width="2%">״̬</td>
	<td  width="6%">��Ʒ����</td>
	<td  width="3%">����ά�޷���ʱ��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">���ʦ</td>
	<td  width="10%">����ά�����˵��</td>
	<td  width="2%">��Ʒ�ӿ���</td>
	<td  width="2%">��Ʒ�ͷ�</td>
	<td  width="2%">VIP�ͷ�</td>
	<td  width="3%">��Ʒ����ʱ��</td>
	<td  width="3%">�ƻ��������ʱ��</td>
	<td  width="3%">�ƻ���װʱ��</td>
	<td  width="10%">����ά�޷���</td>
	<td  width="2%">����¼����</td>
	<td  width="3%">����¼��ʱ��</td>
	<td  width="3%">�����µ�����</td>
	<td  width="2%">�µ���</td>
	<td  width="3%">�����������</td>
	<td  width="2%">����¼����</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="7%">��ע</td>
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