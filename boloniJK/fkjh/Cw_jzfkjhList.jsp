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
	String cw_jzfkjh_fkjhxh=null;
	String cw_jzfkjh_fklxbm=null;
	String cw_jzfkjh_fkcs=null;
	String cw_jzfkjh_yfksj=null;
	String cw_jzfkjh_fkzt=null;
	String cw_jzfkjh_fklrr=null;
	String cw_jzfkjh_fklrsj=null;
	String cw_jzfkjh_lrr=null;
	String cw_jzfkjh_lrsj=null;

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
	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_khxx.khjl='"+khjl+"')";
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
	
	
	
	cw_jzfkjh_fkjhxh=request.getParameter("cw_jzfkjh_fkjhxh");
	if (cw_jzfkjh_fkjhxh!=null)
	{
		cw_jzfkjh_fkjhxh=cf.GB2Uni(cw_jzfkjh_fkjhxh);
		if (!(cw_jzfkjh_fkjhxh.equals("")))	wheresql+=" and  (cw_jzfkjh.fkjhxh='"+cw_jzfkjh_fkjhxh+"')";
	}
	cw_jzfkjh_fklxbm=request.getParameter("cw_jzfkjh_fklxbm");
	if (cw_jzfkjh_fklxbm!=null)
	{
		cw_jzfkjh_fklxbm=cf.GB2Uni(cw_jzfkjh_fklxbm);
		if (!(cw_jzfkjh_fklxbm.equals("")))	wheresql+=" and  (cw_jzfkjh.fklxbm='"+cw_jzfkjh_fklxbm+"')";
	}
	cw_jzfkjh_fkcs=request.getParameter("cw_jzfkjh_fkcs");
	if (cw_jzfkjh_fkcs!=null)
	{
		cw_jzfkjh_fkcs=cw_jzfkjh_fkcs.trim();
		if (!(cw_jzfkjh_fkcs.equals("")))	wheresql+=" and (cw_jzfkjh.fkcs="+cw_jzfkjh_fkcs+") ";
	}
	cw_jzfkjh_yfksj=request.getParameter("cw_jzfkjh_yfksj");
	if (cw_jzfkjh_yfksj!=null)
	{
		cw_jzfkjh_yfksj=cw_jzfkjh_yfksj.trim();
		if (!(cw_jzfkjh_yfksj.equals("")))	wheresql+="  and (cw_jzfkjh.yfksj>=TO_DATE('"+cw_jzfkjh_yfksj+"','YYYY/MM/DD'))";
	}
	cw_jzfkjh_yfksj=request.getParameter("cw_jzfkjh_yfksj2");
	if (cw_jzfkjh_yfksj!=null)
	{
		cw_jzfkjh_yfksj=cw_jzfkjh_yfksj.trim();
		if (!(cw_jzfkjh_yfksj.equals("")))	wheresql+="  and (cw_jzfkjh.yfksj<=TO_DATE('"+cw_jzfkjh_yfksj+"','YYYY/MM/DD'))";
	}
	cw_jzfkjh_fkzt=request.getParameter("cw_jzfkjh_fkzt");
	if (cw_jzfkjh_fkzt!=null)
	{
		cw_jzfkjh_fkzt=cf.GB2Uni(cw_jzfkjh_fkzt);
		if (!(cw_jzfkjh_fkzt.equals("")))	wheresql+=" and  (cw_jzfkjh.fkzt='"+cw_jzfkjh_fkzt+"')";
	}
	cw_jzfkjh_fklrr=request.getParameter("cw_jzfkjh_fklrr");
	if (cw_jzfkjh_fklrr!=null)
	{
		cw_jzfkjh_fklrr=cf.GB2Uni(cw_jzfkjh_fklrr);
		if (!(cw_jzfkjh_fklrr.equals("")))	wheresql+=" and  (cw_jzfkjh.fklrr='"+cw_jzfkjh_fklrr+"')";
	}
	cw_jzfkjh_fklrsj=request.getParameter("cw_jzfkjh_fklrsj");
	if (cw_jzfkjh_fklrsj!=null)
	{
		cw_jzfkjh_fklrsj=cw_jzfkjh_fklrsj.trim();
		if (!(cw_jzfkjh_fklrsj.equals("")))	wheresql+="  and (cw_jzfkjh.fklrsj>=TO_DATE('"+cw_jzfkjh_fklrsj+"','YYYY/MM/DD'))";
	}
	cw_jzfkjh_fklrsj=request.getParameter("cw_jzfkjh_fklrsj2");
	if (cw_jzfkjh_fklrsj!=null)
	{
		cw_jzfkjh_fklrsj=cw_jzfkjh_fklrsj.trim();
		if (!(cw_jzfkjh_fklrsj.equals("")))	wheresql+="  and (cw_jzfkjh.fklrsj<=TO_DATE('"+cw_jzfkjh_fklrsj+"','YYYY/MM/DD'))";
	}
	cw_jzfkjh_lrr=request.getParameter("cw_jzfkjh_lrr");
	if (cw_jzfkjh_lrr!=null)
	{
		cw_jzfkjh_lrr=cf.GB2Uni(cw_jzfkjh_lrr);
		if (!(cw_jzfkjh_lrr.equals("")))	wheresql+=" and  (cw_jzfkjh.lrr='"+cw_jzfkjh_lrr+"')";
	}
	cw_jzfkjh_lrsj=request.getParameter("cw_jzfkjh_lrsj");
	if (cw_jzfkjh_lrsj!=null)
	{
		cw_jzfkjh_lrsj=cw_jzfkjh_lrsj.trim();
		if (!(cw_jzfkjh_lrsj.equals("")))	wheresql+="  and (cw_jzfkjh.lrsj>=TO_DATE('"+cw_jzfkjh_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jzfkjh_lrsj=request.getParameter("cw_jzfkjh_lrsj2");
	if (cw_jzfkjh_lrsj!=null)
	{
		cw_jzfkjh_lrsj=cw_jzfkjh_lrsj.trim();
		if (!(cw_jzfkjh_lrsj.equals("")))	wheresql+="  and (cw_jzfkjh.lrsj<=TO_DATE('"+cw_jzfkjh_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_jzfkjh.fkjhxh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,fklxmc,fkcsmc,cw_jzfkjh.yfksj,cw_jzfkjh.yfkbl||'%',cw_jzfkjh.yfkje, DECODE(cw_jzfkjh.fkzt,'Y','�Ѹ���','N','δ����'),cw_jzfkjh.sfksj,cw_jzfkjh.sfkje,cw_jzfkjh.fklrr,cw_jzfkjh.fklrsj,cw_jzfkjh.lrr,cw_jzfkjh.lrsj,dwmc,cw_jzfkjh.bz,cw_jzfkjh.khbh  ";
	ls_sql+=" FROM crm_khxx,cw_jzfkjh,cw_fklxbm,cw_fkcs,sq_dwxx  ";
    ls_sql+=" where cw_jzfkjh.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_jzfkjh.fklxbm=cw_fklxbm.fklxbm(+) and cw_jzfkjh.fkcs=cw_fkcs.fkcs(+) and cw_jzfkjh.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jzfkjh.khbh desc,cw_jzfkjh.fkjhxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jzfkjhList.jsp","","","ModFkjh.jsp");
	pageObj.setEditStr("�޸�");
	pageObj.setEditBolt("_blank");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"fkjhxh","cw_jzfkjh_khbh","cw_jzfkjh_fklxbm","cw_jzfkjh_fkcs","cw_jzfkjh_yfksj","cw_jzfkjh_yfkbl","cw_jzfkjh_yfkje","cw_jzfkjh_fkzt","cw_jzfkjh_sfksj","cw_jzfkjh_sfkje","cw_jzfkjh_fklrr","cw_jzfkjh_fklrsj","cw_jzfkjh_lrr","cw_jzfkjh_lrsj","cw_jzfkjh_lrbm","cw_jzfkjh_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fkjhxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	/*String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_jzfkjhList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);*/


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
	String[] fkjhxh = request.getParameterValues("fkjhxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(fkjhxh,"fkjhxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_jzfkjh where "+chooseitem;
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
  <B><font size="3">����ƻ���ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">����ƻ����</td>
	<td  width="4%">��ͬ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="5%">���������</td>
	<td  width="3%">��װ��������</td>
	<td  width="4%">Ӧ����ʱ��</td>
	<td  width="3%">Ӧ�������</td>
	<td  width="4%">Ӧ������</td>
	<td  width="3%">����״̬</td>
	<td  width="4%">ʵ����ʱ��</td>
	<td  width="4%">ʵ������</td>
	<td  width="3%">����¼����</td>
	<td  width="4%">����¼��ʱ��</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
	<td  width="20%">��ע</td>
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