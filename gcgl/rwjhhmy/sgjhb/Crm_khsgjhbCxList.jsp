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

	String rwsfwc=null;
	rwsfwc=request.getParameter("rwsfwc");
	if (rwsfwc!=null)
	{
		rwsfwc=cf.GB2Uni(rwsfwc);
		if (!(rwsfwc.equals("")))	wheresql+=" and  (crm_khsgjhb.rwsfwc='"+rwsfwc+"')";
	}

	String sfyq=null;
	sfyq=request.getParameter("sfyq");
	if (sfyq!=null)
	{
		sfyq=cf.GB2Uni(sfyq);
		if (sfyq.equals("Y"))
		{
			wheresql+=" and ( (crm_khsgjhb.rwsfwc='N' and crm_khsgjhb.zxjhjssj<SYSDATE) OR (crm_khsgjhb.rwsfwc='Y' and crm_khsgjhb.zxjhjssj<crm_khsgjhb.sjjssj)  )";
		}
		else if (sfyq.equals("N"))
		{
			wheresql+=" and ( (crm_khsgjhb.rwsfwc='N' and crm_khsgjhb.zxjhjssj>=TRUNC(SYSDATE)) OR (crm_khsgjhb.rwsfwc='Y' and crm_khsgjhb.zxjhjssj>=crm_khsgjhb.sjjssj)  )";
		}
	}

	String zxjhkssj=null;
	zxjhkssj=request.getParameter("zxjhkssj");
	if (zxjhkssj!=null)
	{
		zxjhkssj=cf.GB2Uni(zxjhkssj);
		if (!(zxjhkssj.equals("")))	wheresql+=" and  (crm_khsgjhb.zxjhkssj>=TO_DATE('"+zxjhkssj+"','YYYY-MM-DD'))";
	}
	zxjhkssj=request.getParameter("zxjhkssj2");
	if (zxjhkssj!=null)
	{
		zxjhkssj=cf.GB2Uni(zxjhkssj);
		if (!(zxjhkssj.equals("")))	wheresql+=" and  (crm_khsgjhb.zxjhkssj<=TO_DATE('"+zxjhkssj+"','YYYY-MM-DD'))";
	}

	String zxjhjssj=null;
	zxjhjssj=request.getParameter("zxjhjssj");
	if (zxjhjssj!=null)
	{
		zxjhjssj=cf.GB2Uni(zxjhjssj);
		if (!(zxjhjssj.equals("")))	wheresql+=" and  (crm_khsgjhb.zxjhjssj>=TO_DATE('"+zxjhjssj+"','YYYY-MM-DD'))";
	}
	zxjhjssj=request.getParameter("zxjhjssj2");
	if (zxjhjssj!=null)
	{
		zxjhjssj=cf.GB2Uni(zxjhjssj);
		if (!(zxjhjssj.equals("")))	wheresql+=" and  (crm_khsgjhb.zxjhjssj<=TO_DATE('"+zxjhjssj+"','YYYY-MM-DD'))";
	}

	ls_sql="SELECT khxm,fwdz,sgdmc,zjxm,sjs,crm_khsgjhb.rwxh,crm_khsgjhb.rwmc,DECODE(crm_khsgjhb.rwsfwc,'Y','���','N','��'),crm_khsgjhb.zxjhkssj,crm_khsgjhb.zxjhjssj,crm_khsgjhb.sjkssj,crm_khsgjhb.sjjssj,crm_khxx.khbh ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,crm_khsgjhb ";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_khxx.khbh=crm_khsgjhb.khbh";
	ls_sql+=" and crm_khxx.zt='2'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	 ls_sql+=" order by crm_khxx.khbh desc,crm_khsgjhb.rwxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��

	pageObj.initPage("Crm_khsgjhbCxList.jsp","","/khxx/ViewCrm_khsgjhb.jsp","");
	pageObj.setPageRow(80);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">��ѯ������ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">����</td>
	<td  width="17%">���ݵ�ַ</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">�ʼ�Ա</td>
	<td  width="5%">���ʦ</td>
	<td  width="4%">�������</td>
	<td  width="20%">��������</td>
	<td  width="5%">�����Ƿ����</td>
	<td  width="6%">�ƻ���ʼʱ��</td>
	<td  width="6%">�ƻ�����ʱ��</td>
	<td  width="6%">ʵ�ʿ�ʼʱ��</td>
	<td  width="6%">ʵ�ʽ���ʱ��</td>
	<td  width="6%">�ͻ����</td>
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