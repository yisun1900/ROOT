<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String zwbm=(String)session.getAttribute("zwbm");//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//��ĿרԱ����
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿӹ��ʹ���
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿ����ʦ����

if (zwbm.equals("10"))//10:��ĿרԱ
{
	if (xmzyglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:�Ҿӹ���
{
	if (jjgwglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:�Ҿ����ʦ
{
	if (jjsjsglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String jc_mmydd_khbh=null;
	String crm_khxx_hth=null;
	String crm_khxx_khxm=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_khxm2=null;
	String crm_khxx_lxfs2=null;
	String crm_khxx_fwdz2=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String cxhdbm=null;

	String fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	jc_mmydd_khbh=request.getParameter("jc_mmydd_khbh");
	if (jc_mmydd_khbh!=null)
	{
		jc_mmydd_khbh=cf.GB2Uni(jc_mmydd_khbh);
		if (!(jc_mmydd_khbh.equals("")))	wheresql+=" and  (jc_mmydd.khbh='"+jc_mmydd_khbh+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}


	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}

	crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
	if (crm_khxx_khxm2!=null)
	{
		crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
		if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
	}
	crm_khxx_lxfs2=request.getParameter("crm_khxx_lxfs2");
	if (crm_khxx_lxfs2!=null)
	{
		crm_khxx_lxfs2=cf.GB2Uni(crm_khxx_lxfs2);
		if (!(crm_khxx_lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs2+"%')";
	}
	crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
	if (crm_khxx_fwdz2!=null)
	{
		crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
		if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
	}


	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}

	cxhdbm=request.getParameter("cxhdbm");
	if (cxhdbm!=null)
	{
		cxhdbm=cf.GB2Uni(cxhdbm);
		if (!(cxhdbm.equals("")))	wheresql+=" and  (crm_khxx.cxhdbm='"+cxhdbm+"')";
	}


	String jc_mmydd_yddbh=null;
	String jc_mmydd_clzt=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;

	jc_mmydd_yddbh=request.getParameter("jc_mmydd_yddbh");
	if (jc_mmydd_yddbh!=null)
	{
		jc_mmydd_yddbh=cf.GB2Uni(jc_mmydd_yddbh);
		if (!(jc_mmydd_yddbh.equals("")))	wheresql+=" and  (jc_mmydd.yddbh='"+jc_mmydd_yddbh+"')";
	}
	jc_mmydd_clzt=request.getParameter("jc_mmydd_clzt");
	if (jc_mmydd_clzt!=null)
	{
		jc_mmydd_clzt=cf.GB2Uni(jc_mmydd_clzt);
		if (!(jc_mmydd_clzt.equals("")))	wheresql+=" and  (jc_mmydd.clzt='"+jc_mmydd_clzt+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_mmydd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_mmydd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_mmydd.xmzy='"+xmzy+"')";
	}

	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_mmydd.pdgcmc='"+pdgcmc+"')";
	}
	String pdgcmc2=null;
	pdgcmc2=request.getParameter("pdgcmc2");
	if (pdgcmc2!=null)
	{
		pdgcmc2=cf.GB2Uni(pdgcmc2);
		if (!(pdgcmc2.equals("")))	wheresql+=" and  (jc_mmydd.pdgcmc like '%"+pdgcmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_mmydd.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_mmydd.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_mmydd.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_mmydd.gys like '%"+gys2+"%')";
	}


	String jc_mmydd_wjqk=null;
	String jc_mmydd_wjsgsbz=null;
	String jc_mmydd_htqdr=null;
	String jc_mmydd_lrr=null;
	String jc_mmydd_lrsj=null;
	String jc_mmydd_dwbh=null;

	jc_mmydd_wjqk=request.getParameter("jc_mmydd_wjqk");
	if (jc_mmydd_wjqk!=null)
	{
		jc_mmydd_wjqk=cf.GB2Uni(jc_mmydd_wjqk);
		if (!(jc_mmydd_wjqk.equals("")))	wheresql+=" and  (jc_mmydd.wjqk='"+jc_mmydd_wjqk+"')";
	}
	jc_mmydd_wjsgsbz=request.getParameter("jc_mmydd_wjsgsbz");
	if (jc_mmydd_wjsgsbz!=null)
	{
		jc_mmydd_wjsgsbz=cf.GB2Uni(jc_mmydd_wjsgsbz);
		if (!(jc_mmydd_wjsgsbz.equals("")))	wheresql+=" and  (jc_mmydd.wjsgsbz='"+jc_mmydd_wjsgsbz+"')";
	}
	jc_mmydd_htqdr=request.getParameter("jc_mmydd_htqdr");
	if (jc_mmydd_htqdr!=null)
	{
		jc_mmydd_htqdr=cf.GB2Uni(jc_mmydd_htqdr);
		if (!(jc_mmydd_htqdr.equals("")))	wheresql+=" and  (jc_mmydd.htqdr='"+jc_mmydd_htqdr+"')";
	}
	jc_mmydd_lrr=request.getParameter("jc_mmydd_lrr");
	if (jc_mmydd_lrr!=null)
	{
		jc_mmydd_lrr=cf.GB2Uni(jc_mmydd_lrr);
		if (!(jc_mmydd_lrr.equals("")))	wheresql+=" and  (jc_mmydd.lrr='"+jc_mmydd_lrr+"')";
	}
	jc_mmydd_lrsj=request.getParameter("jc_mmydd_lrsj");
	if (jc_mmydd_lrsj!=null)
	{
		jc_mmydd_lrsj=jc_mmydd_lrsj.trim();
		if (!(jc_mmydd_lrsj.equals("")))	wheresql+="  and (jc_mmydd.lrsj>=TO_DATE('"+jc_mmydd_lrsj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_lrsj=request.getParameter("jc_mmydd_lrsj2");
	if (jc_mmydd_lrsj!=null)
	{
		jc_mmydd_lrsj=jc_mmydd_lrsj.trim();
		if (!(jc_mmydd_lrsj.equals("")))	wheresql+="  and (jc_mmydd.lrsj<=TO_DATE('"+jc_mmydd_lrsj+"','YYYY-MM-DD'))";
	}
	
	jc_mmydd_dwbh=request.getParameter("jc_mmydd_dwbh");
	if (jc_mmydd_dwbh!=null)
	{
		jc_mmydd_dwbh=cf.GB2Uni(jc_mmydd_dwbh);
		if (!(jc_mmydd_dwbh.equals("")))	wheresql+=" and  (jc_mmydd.dwbh='"+jc_mmydd_dwbh+"')";
	}



	String jc_mmydd_htrq=null;

	jc_mmydd_htrq=request.getParameter("jc_mmydd_htrq");
	if (jc_mmydd_htrq!=null)
	{
		jc_mmydd_htrq=jc_mmydd_htrq.trim();
		if (!(jc_mmydd_htrq.equals("")))	wheresql+="  and (jc_mmydd.htrq>=TO_DATE('"+jc_mmydd_htrq+"','YYYY-MM-DD'))";
	}
	jc_mmydd_htrq=request.getParameter("jc_mmydd_htrq2");
	if (jc_mmydd_htrq!=null)
	{
		jc_mmydd_htrq=jc_mmydd_htrq.trim();
		if (!(jc_mmydd_htrq.equals("")))	wheresql+="  and (jc_mmydd.htrq<=TO_DATE('"+jc_mmydd_htrq+"','YYYY-MM-DD'))";
	}




	ls_sql="SELECT yddbh,jc_mmydd.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,jc_mmydd.sqdj,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,DECODE(jc_mmydd.wjqk,'1','�ͻ��Թ�','2','��˾����') wjqk,clztmc,jc_mmydd.lrsj,a.dwmc lrdw ";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_dwxx a,jdm_mmyddzt ";
    ls_sql+=" where jc_mmydd.dwbh=a.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" and jc_mmydd.clzt in('00','01')";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
	}
	else{
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (zwbm.equals("08"))//08:�Ҿӹ���
		{
			ls_sql+=" and (jc_mmydd.clgw='"+yhmc+"' OR jc_mmydd.ztjjgw='"+yhmc+"' OR jc_mmydd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:�Ҿ����ʦ
		{
			ls_sql+=" and (jc_mmydd.jjsjs='"+yhmc+"' OR jc_mmydd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:��ĿרԱ
		{
			ls_sql+=" and (jc_mmydd.xmzy='"+yhmc+"' OR jc_mmydd.lrr='"+yhmc+"')";
		}
	}
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmyddList.jsp","","","EditJc_mmydd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"yddbh","clztmc","khxm","fwdz","hth","xmzy","clgw","ztjjgw","sqdj","wjqk","lrsj","lrdw"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"yddbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_mmyddList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"yddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	if (!yhjs.equals("G0"))
	{
		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey1={"khbh"};//�����в�����coluParm.key������
		coluParm.key=coluKey1;//�����в�����coluParm.key������
		coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("khxm",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��
	}
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] yddbh = request.getParameterValues("yddbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(yddbh,"yddbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from jc_mmydmx where "+chooseitem;
		sql[1]="delete from jc_mmydd where "+chooseitem;
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
  <B><font size="3">ľ�Ŷ���ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="6%">Ԥ�������</td>
	<td  width="7%">����״̬</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="7%">��ͬ��</td>
	<td  width="5%">��ĿרԱ</td>
	<td  width="5%">פ��Ҿӹ���</td>
	<td  width="5%">չ���Ҿӹ���</td>
	<td  width="6%">��ȡ����</td>
	<td  width="6%">������</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="10%">¼�벿��</td>
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